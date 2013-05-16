sentence_library=["I had a ((an adjective)) sandwich for lunch today. It dripped all over my ((a body part)) and ((a noun)).",
  "Our favorite language is ((gem:a gemstone)). We think ((gem)) is better than ((a gemstone))."]
#token_arr = sentence.scan(/\(\(([^)]+)\)\)/)
sentence = sentence_library[rand(sentence_library.size)]
token_arr = sentence.scan(/\(\(.*?\)\)/)

hsh = {}
token_arr.each do |t|
  puts "Enter a word for #{t.delete('()')}?"
  hsh[t] = gets.chomp
end
hsh.each do |key,val|
  sentence.gsub!(key,val)
end
p sentence
