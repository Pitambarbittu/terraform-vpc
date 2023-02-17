# Creating two Subnets
resource "aws_subnet" "pitambar-subnet-1" {
  vpc_id                  = aws_vpc.pitambar-vpc.id
  cidr_block              = "172.16.0.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name    = "pitambar-subnet-1"
    Owner   = "pitambar.bhadra@cloudeq.com"
    Purpose = "training"
  }
}


resource "aws_subnet" "pitambar-subnet-2" {
  vpc_id                  = aws_vpc.pitambar-vpc.id
  cidr_block              = "172.16.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name    = "pitambar-subnet-2"
    Owner   = "pitambar.bhadra@cloudeq.com"
    Purpose = "training"
  }
}
