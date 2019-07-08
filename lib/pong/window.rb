class Window < Gosu::Window
  WINDOW_WIDTH = 640
  WINDOW_HEIGHT = 480

  def initialize
    super WINDOW_WIDTH, WINDOW_HEIGHT
    self.caption = 'Pong'

    @ball = Ball.spawn_ball(window_width: WINDOW_WIDTH, window_height: WINDOW_HEIGHT)
    @paddle_left = Paddle.spawn_paddle(side: 'left', window_width: WINDOW_WIDTH, window_height: WINDOW_HEIGHT)
    @paddle_right = Paddle.spawn_paddle(side: 'right', window_width: WINDOW_WIDTH, window_height: WINDOW_HEIGHT)
  end

  def update
    @ball.detect_paddle_collision(paddles: [@paddle_left, @paddle_right])
    @ball.detect_wall_collision(window_height: WINDOW_HEIGHT)
    @ball.move
  end

  def draw
    @ball.draw
    @paddle_left.draw
    @paddle_right.draw
  end
end
