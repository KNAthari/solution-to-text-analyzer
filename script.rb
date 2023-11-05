def read_text_from_file(filename)
    read_file = FILE.read(filename)
end

input_text = read_text_from_file('sample.txt')

# Word count is called to get a complete word of the text
def word_count(text) 
    frequency = Hash.new(0)
=begin
I created a hash to hold the words of the document as keys and their frequency through out as values.
I chose to downcase in order to avoid capital letters, then I took the values of my hash
and summed them to get out total word count. I also returned our hash to use later on.
=end
    text.downcase.scan(/\b[a-z]{2,16}\b/) do |word|
        frequency[word] += 1
    end
    total_word_count = frequency.values.sum
    puts "Word Count: #{total_word_count}"

    return frequency
end
#Here we found the number of characters using .scan to look for any letters, numbers and puncution in our text.
def character_count(text)
    characters = text.scan(/./)

    total_character_count = characters.length
    puts "Character Count: #{total_character_count}"
end
#here we found the number of paragraphs by using .scan to find any empty spaces between lines.
def paragraph_count(text)
    paragraphs = text.scan(/^\s*$/)

    total_paragraph_count = paragraphs.length
    puts "Paragraph Count: #{total_paragraph_count}" 
end

word = word_count(input_text)
character = character_count(input_text)
paragraph = paragraph_count(input_text)
=begin
most_common_word is using the .max_by to find the most common word in our text
After, I sorted my hash in descending order and placed it in sorted_words
=end
most_common_word = word.max_by { |word, count| count }
sorted_words = word.sort_by { |word, count| -count}
=begin
#Here I used .take with .each to iterate through sorted_words 
and isolate the 10 most common words in out text
=end
puts "Most Common Word: '#{most_common_word[0]}' (Appears #{most_common_word[1]})"
puts "The 10 Most Common Words:"
sorted_words.take(10).each do |word, count|
    puts "#{word}, - #{count}"
end










    