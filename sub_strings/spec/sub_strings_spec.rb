require_relative '../lib/sub_strings'

require 'rspec'

RSpec.describe 'Sub Strings' do
  dictionary = %w[below down go going horn how howdy it i low own part partner sit]

  describe '#sub_strings' do
    it 'Must return hash with 2 keys with value of one for both' do
      expect(sub_strings('below', dictionary)).to eql({ 'below' => 1, 'low' => 1 })
    end

    it 'Must return hash with 11 keys with values ranging from 1 to 3' do
      expect(sub_strings("Howdy partner, sit down! How's it going?", dictionary)).to eql(
        { 'down' => 1, 'go' => 1, 'going' => 1, 'how' => 2, 'howdy' => 1, 'it' => 2, 'i' => 3, 'own' => 1, 'part' => 1, 'partner' => 1, 'sit' => 1 }
      )
    end
  end
end
