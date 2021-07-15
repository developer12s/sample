resource "aws_instance" "firstinstance" {
  instance_type     = "t2.micro"
  ami               = "ami-0dc2d3e4c0f9ebd18"
  availability_zone = var.availability
 
tags = {
    Name = "first"
  }
}

resource "aws_vpc" "firstvpc" {
  cidr_block        = "30.0.0.0/16"

  tags = {
    Name = "first"
  }
}
resource "aws_subnet" "firstpub" {
  cidr_block        = "30.0.1.0/24"
  availability_zone = var.availability
  vpc_id            = aws_vpc.firstvpc.id
  tags = {
    Name = "first"
  }
}



resource "aws_network_interface" "firstinterface" {
  private_ip = "30.0.5.0"
  subnet_id  = aws_subnet.firstpub.id
attachment{
instance=aws_instance.firstinstance.id

device_index=0
}
tags = {
    Name = "first"
  }

}



