

resource "aws_security_group" "ec2_august_sg" {
  name        = "ec2-august-sg"
  description = "Security group for EC2 instance in August"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2_august" {
  ami           = "ami-0d593311db5abb72b"  # Ubuntu 22.04 LTS in us-west-2
  instance_type = "t2.small"
  key_name      = "august-key-pair"

  vpc_security_group_ids = [aws_security_group.ec2_august_sg.id]

  tags = {
    Name = "Ubuntu-August-EC2"
  }
}
