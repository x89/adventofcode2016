require 'digest'

input = 'abbhdwsy'
output = Array.new(8)
output.fill(false)

def outformat(output_array)
  str = String.new
  output_array.each do |e|
    str += e ? e : '_'
  end
  str
end

i = 0
while output.include? false do
  md5 = Digest::MD5.new
  md5 << (input + i.to_s)
  hexdigest = md5.hexdigest()
  if hexdigest[0..4] == '00000' then
    pos = hexdigest[5]
    if ("0".."7").include? pos then
      if output[pos.to_i(16)] != false then
        i += 1
        next
      end
      output[pos.to_i] = md5.hexdigest[6]
      print "#{outformat(output)}\b\b\b\b\b\b\b\b"
    end
  end
  i += 1
end

puts "#{outformat(output)}. Got it!"
