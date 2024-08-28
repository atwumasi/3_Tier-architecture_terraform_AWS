#########################################
## PUBLIC SUBNETS
#########################################


### CREATING PUBLIC WEB SUBNET 1
resource "aws_subnet" "public-web-subnet-1" {
    vpc_id = aws_vpc.multitier-vpc.id
    cidr_block = var.public-web-subnet-1-cidr
    map_public_ip_on_launch = true
    availability_zone = var.zone-1

    tags = {
      Name = "public-web-subnet-1"
    }
 
}


### CREATING PUBLIC WEB SUBNET 2
resource "aws_subnet" "public-web-subnet-2" {
    vpc_id = aws_vpc.multitier-vpc.id
    cidr_block = var.public-web-subnet-2-cidr
    map_public_ip_on_launch = true
    availability_zone = var.zone-2

    tags = {
      Name = "public-web-subnet-2"
    }
 
}


### CREATING PUBLIC WEB SUBNET 3
resource "aws_subnet" "public-web-subnet-3" {
    vpc_id = aws_vpc.multitier-vpc.id
    cidr_block = var.public-web-subnet-3-cidr
    map_public_ip_on_launch = true
    availability_zone = var.zone-3
    
    tags = {
      Name = "public-web-subnet-3"
    }
 
}

### CREATING PRIVATE APP SUBNET 1 
resource "aws_subnet" "private-app-subnet-1" {
    vpc_id = aws_vpc.multitier-vpc.id
    cidr_block = var.private-app-subnet-1-cidr
    map_public_ip_on_launch = true
    availability_zone = var.zone-1
        
    tags = {
      Name = "private-app-subnet-1"
    }
 
}


### CREATING PRIVATE APP SUBNET 2
resource "aws_subnet" "private-app-subnet-2" {
    vpc_id = aws_vpc.multitier-vpc.id
    cidr_block = var.private-app-subnet-2-cidr
    map_public_ip_on_launch = true
    availability_zone = var.zone-2
            
    tags = {
      Name = "private-app-subnet-2"
    }
 
}

### CREATING PRIVATE APP SUBNET 3
resource "aws_subnet" "private-app-subnet-3" {
    vpc_id = aws_vpc.multitier-vpc.id
    cidr_block = var.private-app-subnet-3-cidr
    map_public_ip_on_launch = true
    availability_zone = var.zone-3
                
    tags = {
      Name = "private-app-subnet-3"
    }
 
}


### CREATING PRIVATE DB SUBNET 1 
resource "aws_subnet" "private-db-subnet-1" {
    vpc_id = aws_vpc.multitier-vpc.id
    cidr_block = var.private-db-subnet-1-cidr
    map_public_ip_on_launch = true
    availability_zone = var.zone-1
                
    tags = {
      Name = "private-db-subnet-1"
    }
 
}

### CREATING PRIVATE DB SUBNET 2
resource "aws_subnet" "private-db-subnet-2" {
    vpc_id = aws_vpc.multitier-vpc.id
    cidr_block = var.private-db-subnet-2-cidr
    map_public_ip_on_launch = true
    availability_zone = var.zone-2
                    
    tags = {
      Name = "private-db-subnet-2"
    }
 
}


### CREATING PRIVATE DB SUBNET 3 
resource "aws_subnet" "private-db-subnet-3" {
    vpc_id = aws_vpc.multitier-vpc.id
    cidr_block = var.private-db-subnet-3-cidr
    map_public_ip_on_launch = true
    availability_zone = var.zone-3
                    
    tags = {
      Name = "private-db-subnet-3"
    }
 
}