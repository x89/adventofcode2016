fh = open('6input', mode='r')
lines = []
fh.readlines().each do |line|
  lines.push(line.chomp)
end
fh.close()

# Use array of hashes to store character frequency
frequency_array = 8.times.map {{}}

lines.each do |line|
  line.chars.each_with_index do |c,idx|
    hash = frequency_array[idx]
    if hash.include? c then
      hash[c] += 1
    else
      hash[c] = 1
    end
    # puts "Added char #{c} to hash id #{idx} to make #{hash[c]}"
  end
end

frequency_array.each do |h|
  print h.sort_by{|k,v|v}.to_a[-1][0]
end

puts
