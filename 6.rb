fh = open('6input', mode='r')
lines = Array.new
fh.readlines().each do |line|
  lines.push(line)
end
fh.close()

puts lines
