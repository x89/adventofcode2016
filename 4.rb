fh = open('4input', mode='r')
rooms = Array.new
fh.readlines().each do |line|
  /(?<room>.*)\-(?<num>\d+)\[(?<ck>[a-z]{5})\]/ =~ line
  # puts "#{room.split('-')} num: #{num.to_i}, ck: #{ck}"
  rooms.push(
    {
      :room => room.split('-'),
      :roomstr => room,
      :num => num.to_i,
      :checksum => ck
    }
  )
end
fh.close()

def caesar_cipher(string, shift = 1)
  alphabet = Array('a'..'z')
  encrypter = Hash[alphabet.zip(alphabet.rotate(shift))]
  string.chars.map { |c| encrypter.fetch(c, " ") }
end

count = 0
rooms.each do |r|
  char_count = Hash.new
  r[:roomstr].chars.sort.each do |c|
    next if c == '-'
    if char_count.include? c then
      char_count[c] += 1
    else
      char_count[c] = 1
    end
  end
  ck = String.new
  char_count.sort_by{|k,v|-v}.each_with_index do |a,idx|
    break if idx == 5
    ck += a[0]
  end
  if ck == r[:checksum] then
    count += r[:num]
    r[:reality_check] = true
    puts "Santa's string: #{caesar_cipher(r[:roomstr], r[:num]).join}, id: #{r[:num]}"
  end
end
