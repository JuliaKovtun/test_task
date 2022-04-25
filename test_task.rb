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

def find_frequent_words(text)
  return [] if text.split("").uniq.length < 3
  array = text.scan(/[\w']+/).each { |word| word.downcase! }
  p array
  words = Hash.new(0)
  array.each {|word| words[word] += 1}
  
  words = words.sort_by { |key, value| value }

  words.reverse.first(3)


end

p find_frequent_words("some string, with me i do next")
  s = "Google is an internet search engine. 
      It uses a proprietary algorithm that's designed to retrieve and 
      order search results to provide the most relevant 
      and dependable sources of data possible."
p find_frequent_words(s)
  
