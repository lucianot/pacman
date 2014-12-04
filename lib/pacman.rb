require 'parser'

FILE_NAME = File.join(Dir.home, 'Downloads', '30 horas.html')

puts Parser.parse(FILE_NAME)

# parse file
# write csv