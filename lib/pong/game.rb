class Game
  def initialize
    @window = Window.new
  end

  attr_reader :window

  def self.run
    new.window.show
  end
end
