# Get the latest Amazon Linux 2023 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }
}

# Security Group
resource "aws_security_group" "todo_sg" {
  name        = "${var.project_name}-sg"
  description = "Security group for Todo application"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Todo API"
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

  tags = {
    Name = "${var.project_name}-sg"
  }
}

# EC2 Instance that will host the dockerized Todo application
resource "aws_instance" "todo_server" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  
  associate_public_ip_address = true
  
  vpc_security_group_ids = [aws_security_group.todo_sg.id]

  tags = {
    Name = var.project_name
  }
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/${var.inventory_path}"

  content = templatefile("${path.module}/../ansible/inventory.tpl", {
    public_ip = aws_instance.todo_server.public_ip
    private_key_path = var.private_key_path
  })
}

resource "null_resource" "ansible" {

  depends_on = [aws_instance.todo_server]

  create_duration = "30s"

  depends_on = [
    time_sleep.wait_for_ec2,
    local_file.ansible_inventory
  ]
  

  provisioner "local-exec" {
    command = "cd ../ansible && ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory playbook.yml"
  }
}