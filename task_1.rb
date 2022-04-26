# 1. Написать простой шифр моноподстановки:
# Взять все четные биты строки и сконкатенировать их со всеми нечётными n раз. В
# результате вернуть строку.
# Пример:
# ("Abcdefghij", 1) -> "bdfhjacegi"
# ("Abcdefghij", 2) -> "bdfhjacegi" -> "dhaeibfjcg"
# Написать два метода/функции:
# - encrypt(text, n)
# - decrypt(encrypted_text, n)
# Для обоих методов:
# Если входящая строка пустая или NULL, вернуть значение входящей строки
# Если n <= 0, вернуть исходное значение входной строки
#

def encrypt(text, n)
    return text if text.nil? || text.empty? || n <= 0
    n.times do
      evens = []
      odds = []
      text.split('').each.with_index(1) do |value, index|
        index.even? ? evens << value : odds << value  
      end
      text = (evens + odds).join.downcase
    end
    text
  end
  
  p encrypt("abcdefghi", 3)  #hgfedcbai
  
  def decrypt(encrypted_text, n)
    length = encrypted_text.length
    n.times do
      evens = encrypted_text.split('').take(encrypted_text.length/2)
      odds = encrypted_text.split('').slice((encrypted_text.length/2), encrypted_text.length)
      encrypted_text = odds.zip(evens).join
    end
    encrypted_text
  end
  
  p decrypt("hgfedcbai", 3) #abcdefghij