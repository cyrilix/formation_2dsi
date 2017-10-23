provider aws {
	
}

resource "aws_vpc" "vpc" {
  cidr_block       = "172.23.0.0/16"

  tags {
    Name = "cyrille"
  }
}

resource "aws_subnet" "subnet_public_1" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "172.23.0.0/24"

  tags {
    Name = "cyrille"
  }
}

resource "aws_subnet" "subnet_publici_2" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "172.23.1.0/24"

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

