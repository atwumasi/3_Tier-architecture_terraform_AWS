####################################
# PUBLIC WEB ROUTE TABLE
####################################

resource "aws_route_table" "public-web-rt" {
  vpc_id = aws_vpc.multitier-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.multitier-igw.id
  }

  tags = {
    Name = "public-web-rt"
  }
}

###############################################################
# ROUTE TABLE ASSOCIATION
#############################################################

resource "aws_route_table_association" "public-web-subnet-1-rta" {
    subnet_id      = aws_subnet.public-web-subnet-1.id
    route_table_id = aws_route_table.public-web-rt.id
}

resource "aws_route_table_association" "public-web-subnet-2-rta" {
    subnet_id      = aws_subnet.public-web-subnet-2.id
    route_table_id = aws_route_table.public-web-rt.id
}

resource "aws_route_table_association" "public-web-subnet-3-rta" {
    subnet_id      = aws_subnet.public-web-subnet-3.id
    route_table_id = aws_route_table.public-web-rt.id
}

