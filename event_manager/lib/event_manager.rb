# frozen_string_literal: true

require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'
require 'active_support/core_ext/object/try'
require 'fileutils'

GOOGLE_API_KEY = ENV['CIVIC_INFO_API_KEY']

if GOOGLE_API_KEY.nil?
  puts '[ERROR] > You need to set an environment variable called \'CIVIC_INFO_API_KEY\' with your civic info api key'
  exit 1
end

INPUT_CSV = 'data/event-attendees-partial.csv'
OUTPUT_DIR = 'output'
TEMPLATE_LETTER = 'assets/form_letter.html.erb'

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = GOOGLE_API_KEY

  begin
    civic_info.representative_info_by_address(address: zip, levels: 'country', roles: %w[legislatorUpperBody legislatorLowerBody]).officials
  rescue Google::Apis::ClientError => e
    puts "[WARNING] > #{e.message} | INFO zip=#{zip}"
  rescue Google::Apis::ServerError => e
    puts "[ERROR] > #{e.message} | INFO An error occurred on the server and the request can be retried"
    exit 1
  rescue Google::Apis::AuthorizationError => e
    puts "[ERROR] > #{e.message} | INFO Authorization is required"
    exit 1
  end
end

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def clean_phone_numbers(phone_number)
  phone_number.try(:gsub, /[^\d]/, '')
end

def save_thank_you_letter(id, form_letter)
  FileUtils.mkdir_p(OUTPUT_DIR) unless Dir.exist?(OUTPUT_DIR)
  filename = "output/thanks_#{id}.html"
  File.write(filename, form_letter)
end

def most_common(date_format)
  contents = CSV.foreach(INPUT_CSV, headers: true, header_converters: :symbol)
  date_array = contents.map do |row|
    reg_date = row[:regdate]
    Time.strptime(reg_date, '%M/%d/%y %k:%M').strftime(date_format)
  end

  date_array.group_by { |date| date }.max_by { |_k, v| v.size }.try(:first)
end

def most_common_reg_day
  most_common('%A')
end

def most_common_hour
  most_common('%k')
end

template_letter = File.read(TEMPLATE_LETTER)
erb_template = ERB.new(template_letter)

CSV.foreach(INPUT_CSV, headers: true, header_converters: :symbol) do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)
  phone_number = clean_phone_numbers(row[:homephone])

  form_letter = erb_template.result(binding)

  save_thank_you_letter(id, form_letter)
  puts "• Made a letter for #{name}"
end

puts "The most common hour of registration is: #{most_common_hour}:00"
puts "The most common registration day is: #{most_common_reg_day}"
