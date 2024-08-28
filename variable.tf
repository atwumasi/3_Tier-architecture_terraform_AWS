### Variable declaration of the entire configuration system
variable "region-main" {
  description = "The AWS region to deploy resources"
  type = string
  default = "us-east-1"
}

variable "zone-1" {
  description = "First AZ"
  type = string
  default = "us-east-1a"
}

variable "zone-2" {
  description = "Second AZ"
  type = string
  default = "us-east-1b"
}

variable "zone-3" {
  description = "Third AZ"
  type = string
  default = "us-east-1c"
}

variable "vpc-cidr-block" {
  description = "The CIDR block for the VPC"
  type = string
  default = "172.20.0.0/20"
}

variable "vpc-name" {
  description = "Name of the VPC"
    type = string
    default = "three-tier-vpc"
  
}

variable "public-web-subnet-1-cidr" {
  description = "The CIDR block of the first public web subnet"
    type = string
    default = "172.20.1.0/24"
  
}

variable "public-web-subnet-2-cidr" {
  description = "The CIDR block of the second public web subnet"
    type = string
    default = "172.20.2.0/24"
  
}

variable "public-web-subnet-3-cidr" {
  description = "The CIDR block of the third public web subnet"
    type = string
    default = "172.20.3.0/24"
  
}

variable "private-app-subnet-1-cidr" {
  description = "The CIDR block of the first private app subnet"
    type = string
    default = "172.20.4.0/24"
  
}

variable "private-app-subnet-2-cidr" {
  description = "The CIDR block of the second private app subnet"
    type = string
    default = "172.20.5.0/24"
  
}

variable "private-app-subnet-3-cidr" {
  description = "The CIDR block of the third private app subnet"
    type = string
    default = "172.20.6.0/24"
  
}

variable "private-db-subnet-1-cidr" {
  description = "The CIDR block of the first private db subnet"
    type = string
    default = "172.20.7.0/24"
  
}

variable "private-db-subnet-2-cidr" {
    description = "The CIDR block of the second private db subnet"
    type = string
    default = "172.20.8.0/24"
  
}

variable "private-db-subnet-3-cidr" {
    description = "The CIDR block of the third private db subnet"
    type = string
    default = "172.20.9.0/24"
  
}

variable "ec2-instance-ami" {
  description = "Amazon Linux-2 AMI"
    type = string
    default = "ami-03972092c42e8c0ca"
    

}

variable "ec2-instance-type" {
  description = "Instance type"
  type = string
  default = "t2.micro"
}

variable "ec2-key-name" {
  description = "Pem key"
  type = string
  default = "three-tier"
  
}

variable "db-engine" {
  description = "Engine of the DB"
  type = string
  default = "MySQL"
}

variable "engine-version" {
  description = "Version of the Engine"
  type = string
  default = "8.0.35"
  
}

variable "db-instance-class" {
  description = "Instance class"
  type = string
  default = "db.m5d.large"
  
}


variable "db-username" {
  description = "Database instance Username"
  type = string
  default = "kwabena"
  
}

variable "db-username-pswd" {
  description = "Database instance password"
  type = string
  default = "Atwumasi93"  
}