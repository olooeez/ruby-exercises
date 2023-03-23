require_relative '../lib/caesar_cipher'

require 'rspec'

describe CeasarCipher do
  subject { CeasarCipher.new }

  describe '#encrypt' do
    it 'Works with space, punctuation and lowercase/uppercase letters in a small string with a small rotation' do
      expect(subject.encrypt('Z z!#_?/\\', 5)).to eq('E e!#_?/\\')
    end

    it 'Works with space, punctuation and lowercase/uppercase letters in a big string with a small rotation' do
      expect(subject.encrypt('Wh4t_4#str1ng!?', 5)).to eq('Bm4y_4#xyw1sl!?')
    end

    it 'Works with space, punctuation and lowercase/uppercase letters in a small string with a big rotation' do
      expect(subject.encrypt('Z z!#_?/\\', 83)).to eq('E e!#_?/\\')
    end

    it 'Works with space, punctuation and lowercase/uppercase letters in a big string with a big rotation' do
      expect(subject.encrypt('Wh4t_4#str1ng!?', 83)).to eq('Bm4y_4#xyw1sl!?')
    end

    it 'Works with space, punctuation and lowercase/uppercase letters with a negative rotation' do
      expect(subject.encrypt('Wh4t_4#str1ng!?', -55)).to eq('Te4q_4#pqo1kd!?')
    end
  end
end
