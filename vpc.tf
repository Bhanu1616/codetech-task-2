resource "aws_vpc" "my_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = "true"
  tags = {
    Name = "terraform_vpc"
  }
}


resource "aws_subnet" "my_subnet_1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "terrafor_subnet_1"
  }
}


resource "aws_subnet" "my_subnet_2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "terrafor_subnet_2"
  }
}


resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "terraform_igw"
  }
}

resource "aws_route_table" "my_rb" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
  tags = {
    Namr = "terrafform_route"
  }
}

resource "aws_route_table_association" "public_subnet_association_1a" {
  subnet_id      = aws_subnet.my_subnet_1.id
  route_table_id = aws_route_table.my_rb.id
}


resource "aws_route_table_association" "public_subnet_association_1b" {
  subnet_id      = aws_subnet.my_subnet_2.id
  route_table_id = aws_route_table.my_rb.id
}

