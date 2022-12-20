# Implementing the Cesar Encryption Cipher
class CeasarCipher
  def encrypt(message, key)
    encrypted_message = ''

    message.each_char do |char|
      base = char.ord < 91 ? 65 : 97

      encrypted_message << rotate(char.ord, base, key)
    end

    encrypted_message
  end

  private

  def rotate(ordinal, base, key)
    if ordinal.between?(65, 90) || ordinal.between?(97, 122)
      move = (((ordinal - base) + key) % 26) + base
      move.chr
    else
      ordinal.chr
    end
  end
end
