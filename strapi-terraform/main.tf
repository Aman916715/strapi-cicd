

# -------------------------
# Key pair
# -------------------------
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file(var.public_key_path)
}


# -------------------------
# VPC
# -------------------------
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "StrapiVPC"
  }
}

# -------------------------
# Subnet
# -------------------------
resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "${var.aws_region}a"
  tags = {
    Name = "StrapiSubnet"
  }
}

# -------------------------
# Security group
# -------------------------
resource "aws_security_group" "strapi_sg" {
  name        = "strapi-sg"
  description = "Allow HTTP and SSH"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Strapi HTTP"
    from_port   = 1337
    to_port     = 1337
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

# -------------------------
# EC2 instance
# -------------------------
resource "aws_instance" "strapi" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.deployer.key_name
  subnet_id              = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.strapi_sg.id]
  associate_public_ip_address = true
 

  user_data = templatefile("${path.module}/user_data.sh.tpl", {
    docker_image = "${var.image_uri}:${var.image_tag}"
    region       = var.aws_region
  })

  tags = {
    Name = "StrapiServer-Aman"
  }
}

# -------------------------
# Get latest Ubuntu AMI
# -------------------------
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}
