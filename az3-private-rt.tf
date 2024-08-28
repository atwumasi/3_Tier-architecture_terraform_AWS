####################################
# AZ-3 PRIVATE ROUTE TABLE
####################################

resource "aws_route_table" "az3-private-rt" {
  vpc_id = aws_vpc.multitier-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.az3-nat-gw.id
  }

  tags = {
    Name = "az3-private-rt"
  }
}

###############################################################
# ROUTE TABLE ASSOCIATION
#############################################################

resource "aws_route_table_association" "az3-private-app-subnet-3-rta" {
        subnet_id      = aws_subnet.private-app-subnet-3.id
        route_table_id = aws_route_table.az3-private-rt.id
}

resource "aws_route_table_association" "az3-private-db-subnet-3-rta" {
        subnet_id      = aws_subnet.private-db-subnet-3.id
        route_table_id = aws_route_table.az3-private-rt.id
}