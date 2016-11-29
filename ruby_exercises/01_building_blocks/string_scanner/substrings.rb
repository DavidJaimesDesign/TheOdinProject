dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts "Text please"
text = gets.chomp
words = text.downcase.split(" ")

words_match = words & dictionary
words_not_present = words - words_match
words_to_count = words - words_not_present


frequencies = Hash.new(0)
words_to_count.each {|word| frequencies[word] += 1}
frequencies = frequencies.sort_by {|a, b| b}
frequencies.reverse!
frequencies.each {|word, frequency| puts word + " " + frequency.to_s}

missing_entries = words_not_present & words_not_present

puts "These words were not present in the dictionary" + missing_entries.to_s