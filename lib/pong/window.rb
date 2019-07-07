class Window < Gosu::Window
  def initialize
    super 640, 480
    self.caption = 'Pong'

    @ball = Ball.spawn_ball
    @paddle_left = Paddle.spawn_paddle
    @paddle_right = Paddle.spawn_paddle(side: 'right')
  end

  def update
    @ball.move
  end

  def draw
    @ball.draw
    @paddle_left.draw
    @paddle_right.draw
  end
end
