######################################
# PUBLIC WEB SUBNET 1 NAT GATEWAY
######################################

resource "aws_eip" "nat-gw-eip1" {
  domain = "vpc"
}


resource "aws_nat_gateway" "az1-nat-gw" {
    allocation_id = aws_eip.nat-gw-eip1.id      
    subnet_id =  aws_subnet.public-web-subnet-1.id
    tags = {
        Name = "az1-nat-gw"
    }

    depends_on = [ aws_internet_gateway.multitier-igw ]

}

######################################
# PUBLIC WEB SUBNET 2 NAT GATEWAY
######################################
resource "aws_eip" "nat-gw-eip2" {
  domain = "vpc"
}


resource "aws_nat_gateway" "az2-nat-gw" {
    allocation_id = aws_eip.nat-gw-eip2.id      
    subnet_id =  aws_subnet.public-web-subnet-2.id
    tags = {
        Name = "az2-nat-gw"
    }

    depends_on = [ aws_internet_gateway.multitier-igw ]

}

######################################
# PUBLIC WEB SUBNET 3 NAT GATEWAY
######################################
resource "aws_eip" "nat-gw-eip3" {
  domain = "vpc"
}


resource "aws_nat_gateway" "az3-nat-gw" {
    allocation_id = aws_eip.nat-gw-eip3.id      
    subnet_id =  aws_subnet.public-web-subnet-3.id
    tags = {
        Name = "az3-nat-gw"
    }

    depends_on = [ aws_internet_gateway.multitier-igw ]

}

