####################################
# AZ-1 PRIVATE ROUTE TABLE
####################################

resource "aws_route_table" "az1-private-rt" {
  vpc_id = aws_vpc.multitier-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.az1-nat-gw.id
  }

  tags = {
    Name = "az1-private-rt"
  }
}

###############################################################
# ROUTE TABLE ASSOCIATION
#############################################################

resource "aws_route_table_association" "az1-private-app-subnet-1-rta" {
        subnet_id      = aws_subnet.private-app-subnet-1.id
        route_table_id = aws_route_table.az1-private-rt.id
}

resource "aws_route_table_association" "az1-private-db-subnet-1-rta" {
        subnet_id      = aws_subnet.private-db-subnet-1.id
        route_table_id = aws_route_table.az1-private-rt.id
}

