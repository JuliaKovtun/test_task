# 2. Написать метод/функцию, которая принимает на вход текст (учитывать
# пунктуацию и специальные символы), и возвращает массив из 3х наиболее часто
# встречаемых слов в тексте в порядке убывания.
# - Словом является строка букв (A to Z), опционально содержащая один или более
# апострофов (')
# - Совпадения не должны быть чувствительны к регистру и слова в возвращаемом
# массиве необходимо привести к нижнему регистру
# - Если текст содержит меньше трёх уникальных слов, вернуть пустой массив.
#

def find_frequent_words(text)
  return [] if text.scan(/[\w']+/).uniq.length < 3
  return [] if text.scan(/[\w']+/).uniq == text.scan(/[\w']+/)
  array = text.scan(/[\w']+/).each { |word| word.downcase! }
  words = Hash.new(0)
  array.each {|word| words[word] += 1}
  words = words.sort_by { |key, value| value }
  words.reverse.first(3)
end

p find_frequent_words("small, mouse, dog, save, cat")

  s = "Google is an internet search engine. 
      It uses a proprietary algorithm that's designed to retrieve and 
      order search results to provide the most relevant 
      and dependable sources of data possible."
      
p find_frequent_words(s)
