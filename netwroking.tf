resource "aws_vpc" "javahome" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name     = "JavaHome-${terraform.workspace}"
    Batch    = "7AM"
    Environment = "${terraform.workspace}"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = "${aws_vpc.javahome.id}"
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "Subnet-1"
  }
}

resource "aws_subnet" "private1" {
  vpc_id     = "${aws_vpc.javahome.id}"
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "Private-1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = "${aws_vpc.javahome.id}"
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "Private-1"
  }
}