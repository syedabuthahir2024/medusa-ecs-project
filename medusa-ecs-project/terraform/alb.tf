
resource "aws_lb" "medusa_alb" {
  name               = "medusa-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = aws_subnet.public[*].id

  enable_deletion_protection = false
}

resource "aws_lb_target_group" "medusa_tg" {
  name        = "medusa-tg"
  port        = 9000
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "ip"

  health_check {
    path                = "/health"
    protocol            = "HTTP"
    matcher             = "200-399"
    interval            = 10
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.medusa_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.medusa_tg.arn
  }
}
