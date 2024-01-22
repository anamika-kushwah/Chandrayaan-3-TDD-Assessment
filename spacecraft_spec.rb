# spacecraft_spec.rb

require_relative 'spacecraft_navigation'

RSpec.describe Spacecraft do
  describe '#initialize' do
    it 'creates a new spacecraft with the given initial position and direction' do
      spacecraft = Spacecraft.new(0, 0, 0, 'N')
      expect(spacecraft).to be_instance_of(Spacecraft)
    end
  end

  describe '#move_forward' do
    it 'moves the spacecraft one step forward based on its current direction' do
      spacecraft = Spacecraft.new(0, 0, 0, 'N')
      spacecraft.move_forward
      expect(spacecraft.y).to eq(1)
    end
  end

  describe '#move_backward' do
    it 'moves the spacecraft one step backward based on its current direction' do
      spacecraft = Spacecraft.new(0, 0, 0, 'N')
      spacecraft.move_backward
      expect(spacecraft.y).to eq(-1)
    end
  end

  describe '#turn_left' do
    it 'rotates the spacecraft 90 degrees to the left' do
      spacecraft = Spacecraft.new(0, 0, 0, 'N')
      spacecraft.turn_left
      expect(spacecraft.direction).to eq('W')
    end
  end

  describe '#turn_right' do
    it 'rotates the spacecraft 90 degrees to the right' do
      spacecraft = Spacecraft.new(0, 0, 0, 'N')
      spacecraft.turn_right
      expect(spacecraft.direction).to eq('E')
    end
  end

  describe '#turn_up' do
    it 'rotates the spacecraft upwards' do
      spacecraft = Spacecraft.new(0, 0, 0, 'N')
      spacecraft.turn_up
      expect(spacecraft.direction).to eq('Up')
    end
  end

  describe '#turn_down' do
    it 'rotates the spacecraft downwards' do
      spacecraft = Spacecraft.new(0, 0, 0, 'N')
      spacecraft.turn_down
      expect(spacecraft.direction).to eq('Down')
    end
  end

  describe '#execute_commands' do
    it 'executes a sequence of commands and updates the spacecraft position and direction' do
      spacecraft = Spacecraft.new(0, 0, 0, 'N')
      spacecraft.execute_commands(['f', 'r', 'u', 'b', 'l'])
      expect(spacecraft.position).to eq([0, 1, -1])
      expect(spacecraft.direction).to eq('W')
    end
  end
  
end
