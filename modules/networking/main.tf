data "aws_vpc" "default" {
  default = true
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = data.aws_vpc.default.id
  cidr_block        = var.subnet_cidrs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}



