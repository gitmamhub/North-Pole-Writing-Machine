require 'erb'

system('clear')
kids_data   = File.read('data/kids-data.txt')
naughty_letter = File.read('templates/naughty_letter_template.txt.erb')

my_kid = []
i = 0
kids_data.each_line do |kid|

  kid_data_array = kid.split
  my_kid[i] = kid_data_array


# infraction = []
# puts "#{my_kid[3]}"
# pos = my_kid[3].find_index("|")
# puts pos
# length = my_kid[3].length
# puts "#{my_kid[3][(pos+1)..(length-1)]}"
# puts length
# infraction = my_kid[3][(pos+1)..(length-1)]


  name     = kid_data_array[0]
  behavior = kid_data_array[1]
  toys     = kid_data_array[rand(2..7)]

  next unless behavior == 'naughty'

  filename    = 'letters/naughty/' + name + '.txt'
  letter_text = ERB.new(naughty_letter, nil, '-').result(binding)

  puts "Writing #{filename}."
  File.write(filename, letter_text)
i = i +1
end

puts 'Done!'
