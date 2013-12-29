rabbit = ["red", "white", "blue", "orange", "alabaster", "turquoise", "Alabaster"]

puts "rabbit = #{rabbit}"
puts "Sorted rabbit = #{rabbit.sort}"

rabbit.each do |r|
  r.downcase!
end

puts "\nLet's try this again.\n"
puts "rabbit = #{rabbit}"
puts "Sorted rabbit = #{rabbit.sort}"


