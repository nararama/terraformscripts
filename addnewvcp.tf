// Create Data Team security groups
//
resource "aws_security_group" "crawler" {
  name        = "crawler"
  description = "xrpldb crawler accesss"
vpc_id = "vpc-042ae61"
  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["10.30.73.80/32","10.30.73.80/28"]
  }
egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

  tags = {
    Name = "crawler"
  }
}
