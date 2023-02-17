# Creating One Vpc
resource "aws_vpc" "pitambar-vpc" {
  cidr_block = "172.16.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "pitambar-vpc"
    Owner = "pitambar.bhadra@cloudeq.com"
    Purpose = "training"
  }
}
#-----------------------------------------------------------------------------------------------------
# Creating two Subnets
resource "aws_subnet" "pitambar-subnet-1" {
  vpc_id = "${aws_vpc.pitambar-vpc.id}"
  cidr_block = "172.16.0.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"

  tags = {
    Name = "pitambar-subnet-1"
    Owner = "pitambar.bhadra@cloudeq.com"
    Purpose = "training"
  }
}


resource "aws_subnet" "pitambar-subnet-2" {
  vpc_id = "${aws_vpc.pitambar-vpc.id}"
  cidr_block = "172.16.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"

  tags = {
    Name = "pitambar-subnet-2"
    Owner = "pitambar.bhadra@cloudeq.com"
    Purpose = "training"
  }
}

#--------------------------------------------------------------------------------------------
#Creating two EC-2 instance in first subnet

resource "aws_instance" "pitambar-ec2-1" {
  ami = "ami-0dfcb1ef8550277af"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.pitambar-security.id}"]
  subnet_id = "${aws_subnet.pitambar-subnet-1.id}"

  key_name = "pitambar-key-pair"
  count = 2
  associate_public_ip_address = true
  tags = {
    Name = "pitambar-ec2-1"
    Owner = "pitambar.bhadra@cloudeq.com"
    Purpose = "training"
  }

  volume_tags = {
    Name = "pitambar-ec2-1"
    Owner = "pitambar.bhadra@cloudeq.com"
    Purpose = "training"
  }
}

output "instance_id_list" {
  value = ["${aws_instance.pitambar-ec2-1.*.id}"]
}

#--------------------------------------------------------------------------------------------------------
#Creating two EC-2 instance in second subnet

resource "aws_instance" "pitambar-ec2-2" {
  ami = "ami-0dfcb1ef8550277af"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.pitambar-security.id}"]
  subnet_id = "${aws_subnet.pitambar-subnet-2.id}"

  key_name = "pitambar-key-pair"
  count = 2
  associate_public_ip_address = true
  tags = {
    Name = "pitambar-ec2-2"
    Owner = "pitambar.bhadra@cloudeq.com"
    Purpose = "training"
  }

  volume_tags = {
    Name = "pitambar-ec2-2"
    Owner = "pitambar.bhadra@cloudeq.com"
    Purpose = "training"
  }
}

output "instance_second_id_list" {
  value = ["${aws_instance.pitambar-ec2-2.*.id}"]
}




