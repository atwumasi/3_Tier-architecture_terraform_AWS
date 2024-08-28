####################################
# AZ-2 PRIVATE ROUTE TABLE
####################################

resource "aws_route_table" "az2-private-rt" {
  vpc_id = aws_vpc.multitier-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.az2-nat-gw.id
  }

  tags = {
    Name = "az2-private-rt"
  }
}

###############################################################
# ROUTE TABLE ASSOCIATION
#############################################################

resource "aws_route_table_association" "az2-private-app-subnet-2-rta" {
        subnet_id      = aws_subnet.private-app-subnet-2.id
        route_table_id = aws_route_table.az2-private-rt.id
}

resource "aws_route_table_association" "az2-private-db-subnet-2-rta" {
        subnet_id      = aws_subnet.private-db-subnet-2.id
        route_table_id = aws_route_table.az2-private-rt.id
}

