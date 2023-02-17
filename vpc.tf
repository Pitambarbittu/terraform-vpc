# Creating One Vpc
resource "aws_vpc" "pitambar-vpc" {
  cidr_block       = "172.16.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name    = "pitambar-vpc"
    Owner   = "pitambar.bhadra@cloudeq.com"
    Purpose = "training"
  }
}
