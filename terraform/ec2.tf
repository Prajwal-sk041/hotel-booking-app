# Data source for latest Ubuntu AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Kubernetes Master Node (FREE TIER: t3.micro)
resource "aws_instance" "k8s_master" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.public[0].id
  vpc_security_group_ids = [aws_security_group.k8s_master.id]

  root_block_device {
    volume_size = 20
    volume_type = "gp2"
  }

  user_data = <<-EOF
              #!/bin/bash
              hostnamectl set-hostname k8s-master
              apt-get update
              apt-get install -y docker.io curl wget
              systemctl enable docker
              systemctl start docker
              EOF

  tags = {
    Name = "${var.project_name}-k8s-master"
    Role = "master"
  }
}

# Kubernetes Worker Node (FREE TIER: t3.micro)
resource "aws_instance" "k8s_worker" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.public[0].id
  vpc_security_group_ids = [aws_security_group.k8s_worker.id]

  root_block_device {
    volume_size = 10
    volume_type = "gp2"
  }

  user_data = <<-EOF
              #!/bin/bash
              hostnamectl set-hostname k8s-worker
              apt-get update
              apt-get install -y docker.io curl wget
              systemctl enable docker
              systemctl start docker
              EOF

  tags = {
    Name = "${var.project_name}-k8s-worker"
    Role = "worker"
  }
}
