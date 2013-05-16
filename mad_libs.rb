def get_token_array(sentence)
  # ask for user input and subsitute
  #Example:I had a ((an adjective)) sandwich for lunch today. It dripped all over my ((a body part)) and ((a noun)).
  token_arr = sentence.scan(/\(\(.*\)\)/)
end
def get_user_input(token)
  puts "Enter a word or phrase to substitute for #{token}."
  sub_str = gets
  sub_str
end
def hash_substitutes(token_arr)
  hash_sub = {}
  token_arr.each do |t|
    hash_sub[t] = get_user_input(t)
  end
  hash_sub
end
p get_token_array("I had a ((an adjective)) sandwich for breakfast today. It oozed all
over my ((a body part)) and ((a noun)).")