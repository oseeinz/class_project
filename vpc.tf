# Create a VPC
resource "aws_vpc" "TF_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "TF_vpc"
  }
}
#Add subnet public
resource "aws_subnet" "TFsub_pub" {
  vpc_id     = "${aws_vpc.TF_vpc.id}"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "TFsub_pub"
  }
}
#Add subnet Private
resource "aws_subnet" "TFsub_pv" {
  vpc_id     = "${aws_vpc.TF_vpc.id}"
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "TFsub_pv"
  }
}
#Add internet gateway
resource "aws_internet_gateway" "TF_ig" {
  vpc_id = "${aws_vpc.TF_vpc.id}"

  tags = {
    Name = "TF_ig"
  }
}
#Add route table
resource "aws_route_table" "TF_rt" {
  vpc_id = "${aws_vpc.TF_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.TF_ig.id}"
  }

  tags = {
    Name = "TF_rt"
  }
}
#Associate route table with TFsub_pub
resource "aws_route_table_association" "TF_pub" {
  subnet_id      = "${aws_subnet.TFsub_pub.id}"
  route_table_id = "${aws_route_table.TF_rt.id}"
}
#Associate route table with TFsub_pv
resource "aws_route_table_association" "TF_pv" {
  subnet_id      = "${aws_subnet.TFsub_pv.id}"
  route_table_id = "${aws_route_table.TF_rt.id}"
}
#Add Security group
resource "aws_security_group" "TF_sg" {
  name        = "TF_sg"
  description = "Allow only ssh and http inbound traffic"
  vpc_id      = "${aws_vpc.TF_vpc.id}"

  ingress {
    # TLS (change to whatever ports you need)
    # Please restrict your ingress to only necessary IPs and ports.
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"]
  }
 egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags = {
    Name = "TF_sg"
  }
}
