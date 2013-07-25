sentence_library=["I had a ((an adjective)) sandwich for lunch today. It dripped all over my ((a body part)) and ((a noun)).",
  "Our favorite language is ((gem:a gemstone)). We think ((gem)) is better than ((a gemstone)).",  "Our favorite food is ((egg:chicken)). We think ((egg)) is better than ((diamond)).  That's because ((coal:diamond)) don't have a lot of ((chicken))"]
sentence = sentence_library[rand(sentence_library.size)]
def reuse_token?(token_arr)
  index_arr=[]
  token_arr.each_index do |i|
    if token_arr[i].include?(":")
      index_arr << i 
    end
  end
  return index_arr
end
def create_token_hash(token_arr)
  index_arr = reuse_token?(token_arr)
  token_hash = Hash.new
  index_arr.each do |i|
    dup_token = token_arr[i].scan(/\(\(.*:/)[0]  
    dup_token = dup_token.scan(/([A-Za-z0-9-]+)/)[0][0].to_s
   
    dup_token2 = token_arr[i].scan(/:.*\)\)/)[0]
    dup_token2 = dup_token2.scan(/([A-Za-z0-9\-\s]+)/)[0][0].to_s
    
    combo_key = "((#{dup_token}:#{dup_token2}))"

    dup_token = "(("+dup_token+"))"
    dup_token2 = "(("+dup_token2+"))"
    token_arr[i] = dup_token
    puts "Enter a word for #{dup_token}?"
    token_hash[dup_token]=gets.chomp
    puts "Enter a word for #{dup_token2}?"
    token_hash[dup_token2]=gets.chomp
    token_hash[combo_key] = token_hash[dup_token]
  end
  return token_hash
end
token_arr = sentence.scan(/\(\(.*?\)\)/)
token_hash = create_token_hash(token_arr)
token_arr.each do |t|
  unless token_hash.has_key?(t)
    puts "Enter a word for #{t.delete('()')}?"
    token_hash[t] = gets.chomp
  end
end
token_hash.each do |key,val|
  sentence.gsub!(key,val)
end
p sentence
