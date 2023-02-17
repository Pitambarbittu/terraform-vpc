#Creating two EC-2 instance in first subnet

resource "aws_instance" "pitambar-ec2-1" {
  ami                    = "ami-0dfcb1ef8550277af"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.pitambar-security.id}"]
  subnet_id              = aws_subnet.pitambar-subnet-1.id

  key_name                    = "pitambar-key-pair"
  count                       = 2
  associate_public_ip_address = true
  tags = {
    Name    = "pitambar-ec2-1"
    Owner   = "pitambar.bhadra@cloudeq.com"
    Purpose = "training"
  }

  volume_tags = {
    Name    = "pitambar-ec2-1"
    Owner   = "pitambar.bhadra@cloudeq.com"
    Purpose = "training"
  }
}

# ----------------------------------------------------------

#Creating two EC-2 instance in second subnet

resource "aws_instance" "pitambar-ec2-2" {
  ami                    = "ami-0dfcb1ef8550277af"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.pitambar-security.id}"]
  subnet_id              = aws_subnet.pitambar-subnet-2.id

  key_name                    = "pitambar-key-pair"
  count                       = 2
  associate_public_ip_address = true
  tags = {
    Name    = "pitambar-ec2-2"
    Owner   = "pitambar.bhadra@cloudeq.com"
    Purpose = "training"
  }

  volume_tags = {
    Name    = "pitambar-ec2-2"
    Owner   = "pitambar.bhadra@cloudeq.com"
    Purpose = "training"
  }
}


