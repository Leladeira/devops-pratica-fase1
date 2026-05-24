variable "region" {
  description = "Regiao da AWS"
  default     = "us-east-1"
}

provider "aws" {
  region = var.region
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = { Name = "devops-vpc" }
}

resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}a"
  tags = { Name = "devops-public-subnet-a" }
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "${var.region}b"
  tags = { Name = "devops-private-subnet-b" }
}

resource "aws_db_subnet_group" "db_group" {
  name       = "devops-db-subnet-group"
  subnet_ids = [aws_subnet.public_a.id, aws_subnet.private_b.id]
  tags       = { Name = "devops-db-subnet-group" }
}