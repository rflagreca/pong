class Ball
  BALL_SPEED = 5.0
  BALL_WIDTH = 5.0

  def self.spawn_ball(window_width: 640, window_height: 480)
    ball = new
    ball.update_position(window_width * 0.5, window_height * 0.5)
    ball.update_velocity
    ball
  end

  def initialize
    @position_x, @position_y, @velocity_x, @velocity_y = 0.0
  end

  def update_position(position_x, position_y)
    @position_x = position_x
    @position_y = position_y
  end

  def update_velocity(velocity_x: BALL_SPEED, velocity_y: 0.00)
    @velocity_x = velocity_x
    @velocity_y = velocity_y
  end

  def move
    @position_x += @velocity_x
    @position_y += @velocity_y
  end

  def detect_paddle_collision(paddles)
    paddles.each do |paddle|
      paddle_x_threshold = paddle.position_x + Paddle::PADDLE_WIDTH
      paddle_top = paddle.position_y - (Paddle::PADDLE_HEIGHT * 0.5)
      paddle_bottom = paddle.position_y + (Paddle::PADDLE_HEIGHT * 0.5)

      next unless @position_x == paddle_x_threshold &&
                  (@position_y >= paddle_top && @position_y <= paddle_bottom)

      relative_y_intersect = paddle.position_y - @position_y
      @velocity_x = -@velocity_x
      @velocity_y = -relative_y_intersect
    end
  end

  def detect_wall_collision(window_height)
    @velocity_y = -@velocity_y if @position_y == window_height || @position_y.zero?
  end

  def draw
    Gosu.draw_rect(@position_x - BALL_WIDTH, @position_y - BALL_WIDTH, BALL_WIDTH, BALL_WIDTH, Gosu::Color::WHITE)
  end
end
