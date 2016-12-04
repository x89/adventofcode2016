fh = open('3input', mode='r')
lines = Array.new
fh.readlines().each do |line|
  /(\d+)\W+?(\d+)\W+?(\d+)/ =~ line
  lines.push([$1.to_i, $2.to_i, $3.to_i])
end
fh.close()

def possible(a)
  [
    a[0] + a[1] > a[2],
    a[0] + a[2] > a[1],
    a[1] + a[2] > a[0]
  ].all?
  #puts "#{a[0]} + #{a[1]} > #{a[2]} — #{a[0] + a[1] > a[2]}"
end

lines.reject! do |l|
  not possible(l)
end

puts lines.count
