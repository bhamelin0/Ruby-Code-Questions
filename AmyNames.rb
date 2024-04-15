# Simple function that reads a file through a command line arg and generates random names.
# Call like ruby.exe .\AmyNames.rb .\Data 4
input_array = ARGV

if ARGV.length > 2 then
  puts "Too many arguments, put the file name in quotations next time"
  return
end

fileName = ARGV[0]
count = ARGV[1].to_i

if count < 1
  puts "Argument 2, the count, was 0 or not a number, returning"
  return
end

text = File.read(fileName)
nameArr = text.split(',')

while count > 0 do
  nameIndex = Random.rand(nameArr.length)
  name = nameArr[nameIndex]
  puts name
  nameArr.delete_at(nameIndex)
  count = count - 1
end
