class Paddle
  PADDLE_WIDTH = 10.0
  PADDLE_HEIGHT = 50.0

  def self.spawn_paddle(side: 'left', window_width: 640.0, window_height: 480)
    paddle = new
    if side == 'left'
      paddle.update_position(0.0, window_height * 0.5)
    elsif side == 'right'
      paddle.update_position(window_width - PADDLE_WIDTH, window_height * 0.5)
    end
    paddle
  end

  def initialize
    @position_x = 0.0
    @position_y = 0.0
    @velocity_x = 0.0
    @velocity_y = 0.0
  end

  def update_position(position_x, position_y)
    @position_x = position_x
    @position_y = position_y
  end

  def draw
    Gosu.draw_rect(@position_x, @position_y - (PADDLE_HEIGHT * 0.5), PADDLE_WIDTH, PADDLE_HEIGHT, Gosu::Color::WHITE)
  end
end
