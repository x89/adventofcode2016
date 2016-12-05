require 'digest'

input = 'abbhdwsy'
# input = 'abc'
output = String.new
i = 0
while output.length < 8 do
  md5 = Digest::MD5.new
  md5 << input + i.to_s
  # puts "#{input + i.to_s} - #{md5.hexdigest}"
  if md5.hexdigest[0..4] == '00000' then
    output += md5.hexdigest[5]
  end
  i += 1
end

puts output
