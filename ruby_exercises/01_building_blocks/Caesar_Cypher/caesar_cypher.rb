puts "Text to be Encrypted please"
text = gets.chomp

puts "Shift factor please"
shift = gets.chomp

def cypher(t,s)
	@t = t
	@s = s.to_i
	ascii = t.chars.map {|c| c.ord}
	shifted = ascii.map  do |c| if c == 32
									c
								else
									c + @s
								end
						end
	puts shifted.map {|c| c.chr}.join
end

cypher(text, shift)