# Three Tier Architecture on AWS using Terraform 

## Overview 
This project demonstrates a scalable and secure three-tier architecture implemented on AWS for an online pharmaceutical store. The architecture is designed to ensure high availability, fault tolerance, and security, leveraging various AWS services such as EC2, RDS, and S3. The infrastructure is provisioned using Terraform, ensuring consistent and reproducible deployments.


# Key Features

## High Availability: Leveraging multiple Availability Zones (AZs) to ensure the application remains accessible even in the event of an AZ failure.
Scalability: Auto-scaling groups for the presentation and application layers to handle varying levels of traffic.
Security: Implementation of strict security groups and isolation of layers to minimize exposure and potential attack vectors.
Automation: Infrastructure is fully managed and provisioned using Terraform, enabling quick and consistent deployments.

# Setup Instructions

## Prerequisites
AWS Account
Terraform installed
AWS CLI configured with appropriate permissions
SSH key pair for accessing EC2 instances
