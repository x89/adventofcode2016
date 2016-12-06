fh = open('6input', mode='r')
lines = Array.new
fh.readlines().each do |line|
  lines.push(line.chomp)
end
fh.close()

# Use array of hashes to store character frequency
lines.each do |line|
  puts line
  line.chars.each_with_index do |c,idx|
    puts "#{idx}: #{c}"
  end
end
