provider aws {}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags {
    Name = "cyrille"
  }
}

resource "aws_subnet" "subnet_public_1" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true

  tags {
    Name = "cyrille"
  }
}

resource "aws_subnet" "subnet_public_2" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "10.0.1.0/24"

  tags {
    Name = "cyrille"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "cyrille"
  }
}

resource aws_eip "eip_nat" {}

resource "aws_nat_gateway" "gw_nat" {
  allocation_id = "${aws_eip.eip_nat.id}"
  subnet_id     = "${aws_subnet.subnet_public_1.id}"

  tags {
    Name = "cyrille"
  }
}

resource "aws_route_table" "route_table1" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name = "cyrille"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.subnet_public_1.id}"
  route_table_id = "${aws_route_table.route_table1.id}"
}
