class Point
  @x = Integer
  @y = Integer

  def initialize
    @x = 0
    @y = 0
  end

  def north(d)
    @y += d.to_i
  end

  def east(d)
    @x += d.to_i
  end

  def south(d)
    @y -= d.to_i
  end

  def west(d)
    @x -= d.to_i
  end

  def to_s
    "(#{@x}, #{@y})"
  end

  def blocks
    @x.abs + @y.abs
  end
end

class Car  # Not really a car but basically a car
  @grid = Array.new
  @facing = ''
  @directions = Array.new
  @visited = Array.new

  def initialize
    @facing = 'north'
    @directions = ['north', 'east', 'south', 'west']
    @point = Point.new
    @visited = []
  end

  def rotate(direction)
    idx = @directions.index(@facing)
    case direction
      when 'R' then @facing = @directions[(idx + 1) % 4]
      when 'L' then @facing = @directions[(idx - 1) % 4]
    end
    "rotating #{direction} to face #{@facing}"
  end

  def walk(distance)
    @visited.push(@point.dup)
    @point.send(@facing, distance)
    "walking #{distance} blocks #{@facing} from #{@visited[-1]} to #{@point}"
  end

  def visited
    @visited
  end

  def first_visited
    seen = Hash.new
    a = Array.new
    @visited.each do |p|
      if seen.has_key? p.to_s then
         a.push(p)
      end
      seen[p.to_s] = true
    end
    return a
  end

  def move(str)
    /(?<direction>[RL])(?<distance>\d+)/ =~ str
    rotate(direction)
    walk(distance)
    "you're now #{@point.blocks} blocks away"
  end
end

path_str = "R4, R4, L1, R3, L5, R2, R5, R1, L4, R3, L5, R2, L3, L4, L3, R1, R5, R1, L3, L1, R3, L1, R2, R2, L2, R5, L3, L4, R4, R4, R2, L4, L1, R5, L1, L4, R4, L1, R1, L2, R5, L2, L3, R2, R1, L194, R2, L4, R49, R1, R3, L5, L4, L1, R4, R2, R1, L5, R3, L5, L4, R4, R4, L2, L3, R78, L5, R4, R191, R4, R3, R1, L2, R1, R3, L1, R3, R4, R2, L2, R1, R4, L5, R2, L2, L4, L2, R1, R2, L3, R5, R2, L3, L3, R3, L1, L1, R5, L4, L4, L2, R5, R1, R4, L3, L5, L4, R5, L4, R5, R4, L3, L2, L5, R4, R3, L3, R1, L5, R5, R1, L3, R2, L5, R5, L3, R1, R4, L5, R4, R2, R3, L4, L5, R3, R4, L5, L5, R4, L4, L4, R1, R5, R3, L1, L4, L3, L4, R1, L5, L1, R2, R2, R4, R4, L5, R4, R1, L1, L1, L3, L5, L2, R4, L3, L5, L4, L1, R3"
path_str = 'R8, R4, R4, R8'
paths = path_str.split(', ')

c = Car.new
paths.each do |p|
  c.move(p)
end
