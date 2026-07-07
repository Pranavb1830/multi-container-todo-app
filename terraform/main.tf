provider "aws" {
  region = "ap-south-1" # Mumbai
}

resource "aws_instance" "todo_server" {
  ami           = "ami-0f5ee92e2d63afc18" # Amazon Linux 2 (ap-south-1)
  instance_type = "t2.micro"

  key_name = "multi-container-todo" 

  vpc_security_group_ids = [aws_security_group.todo_sg.id]

  tags = {
    Name = "todo-app-server"
  }
}

resource "aws_security_group" "todo_sg" {
  name = "todo-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
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