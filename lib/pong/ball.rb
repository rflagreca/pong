class Ball
  BALL_SPEED = 0.0
  BALL_WIDTH = 5.0

  def self.spawn_ball(window_width: 640, window_height: 480)
    ball = new
    ball.update_position(window_width * 0.5, window_height * 0.5)
    ball.update_velocity
    ball
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

  def update_velocity(velocity_x: BALL_SPEED, velocity_y: 0.0)
    @velocity_x = velocity_x
    @velocity_y = velocity_y
  end

  def move
    detect_window_collision
    @position_x += @velocity_x
    @position_y += @velocity_y
  end

  def detect_window_collision(window_width: 640, window_height: 480)
    @velocity_x = -@velocity_x if @position_y == window_height || @position_y.zero?
  end

  def draw
    Gosu.draw_rect(@position_x - BALL_WIDTH, @position_y - BALL_WIDTH, BALL_WIDTH, BALL_WIDTH, Gosu::Color::WHITE)
  end
end
