#Creating internet Gateway
resource "aws_internet_gateway" "pitambar-gateway" {
  vpc_id = aws_vpc.pitambar-vpc.id
  tags = {
    Name    = "pitambar-subnet"
    Owner   = "pitambar.bhadra@cloudeq.com"
    Purpose = "training"
  }
}

#---------------------------------------------------------------------------------------------------------
# This is my Route
resource "aws_route_table" "pitambar-route" {
  vpc_id = aws_vpc.pitambar-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.pitambar-gateway.id
  }

  tags = {
    Name    = "pitambar-route"
    Owner   = "pitambar.bhadra@cloudeq.com"
    Purpose = "training"
  }
}


#---------------------------------------------------------------------------------------------------------

#for subnet-1
resource "aws_route_table_association" "pitambar-crta-public-subnet-1" {
  subnet_id      = aws_subnet.pitambar-subnet-1.id
  route_table_id = aws_route_table.pitambar-route.id
}

#for subnet-2
resource "aws_route_table_association" "pitambar-crta-public-subnet-2" {
  subnet_id      = aws_subnet.pitambar-subnet-2.id
  route_table_id = aws_route_table.pitambar-route.id
}



#----------------------------------------------------------------------------------------------
# Creating aws Security Group
resource "aws_security_group" "pitambar-security" {
  vpc_id = aws_vpc.pitambar-vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name    = "pitambar-security"
    Owner   = "pitambar.bhadra@cloudeq.com"
    Purpose = "training"
  }
}
