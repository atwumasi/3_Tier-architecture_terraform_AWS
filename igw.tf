resource "aws_internet_gateway" "multitier-igw" {
    vpc_id = aws_vpc.multitier-vpc.id
    
    tags = {
        Name = "multitier-igw"
    }

}