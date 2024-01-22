class Spacecraft
  DIRECTIONS = ['N', 'S', 'E', 'W', 'Up', 'Down'].freeze

  attr_accessor :x, :y, :z, :direction

  def initialize(x, y, z, direction)
    @x = x
    @y = y
    @z = z
    @direction = direction
  end

  def position
    [x, y, z]
  end

  def move_forward
    update_position(1)
  end

  def move_backward
    update_position(-1)
  end

  def turn_left
    current_index = DIRECTIONS.index(direction)
    return if current_index.nil?
  
    self.direction = DIRECTIONS.rotate(-1)[current_index]
    self.direction = 'W' if self.direction == 'Down'  # Wrap around for 'Down'
  end
  
  def turn_right
    current_index = DIRECTIONS.index(direction)
    return if current_index.nil?
  
    self.direction = DIRECTIONS.rotate(-1)[current_index]
    self.direction = 'E' if self.direction == 'Down'  # Wrap around for 'Down'
  end

  def turn_up
    self.direction = 'Up' if ['N', 'S', 'E', 'W'].include?(direction)
  end

  def turn_down
    self.direction = 'Down' if ['N', 'S', 'E', 'W'].include?(direction)
  end

  def execute_commands(commands)
    commands.each do |command|
      case command
      when 'f' then move_forward
      when 'b' then move_backward
      when 'l' then turn_left
      when 'r' then turn_right
      when 'u' then turn_up
      when 'd' then turn_down
      end
    end
  end
  

  def to_s
    "Final Position: (#{x}, #{y}, #{z})\nFinal Direction: #{direction}"
  end

  private

  def update_position(delta)
    case direction
    when 'N' then @y += delta
    when 'S' then @y -= delta
    when 'E' then @x += delta
    when 'W' then @x -= delta
    when 'Up' then @z += delta
    when 'Down' then @z -= delta
    end
  end

  def update_direction(step)
    current_index = DIRECTIONS.index(direction)
    return if current_index.nil?
  
    self.direction = DIRECTIONS[(current_index + step) % DIRECTIONS.length]
  end
  
end

# Get user input
print 'Enter initial X position: '
initial_x = gets.chomp.to_i

print 'Enter initial Y position: '
initial_y = gets.chomp.to_i

print 'Enter initial Z position: '
initial_z = gets.chomp.to_i

print 'Enter initial direction (N, S, E, W, Up, Down): '
initial_direction = gets.chomp.upcase

print 'Enter commands (e.g., "f", "r", "u", "b", "l"): '
commands = gets.chomp.downcase.split('')

# Example usage with user input:
chandrayaan = Spacecraft.new(initial_x, initial_y, initial_z, initial_direction)
chandrayaan.execute_commands(commands)

puts chandrayaan
