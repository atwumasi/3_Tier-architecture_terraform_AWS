# Three Tier Architecture on AWS using Terraform 

## Overview 
This project demonstrates a scalable and secure three-tier architecture implemented on AWS for an online pharmaceutical store. 
The architecture is designed to ensure high availability, fault tolerance, and security, leveraging various AWS services such as EC2, RDS, and S3.
The infrastructure is provisioned using Terraform, ensuring consistent and reproducible deployments.


# Key Features

1. High Availability: Leveraging multiple Availability Zones (AZs) to ensure the application remains accessible even in the event of an AZ failure.
2. Scalability: Auto-scaling groups for the presentation and application layers to handle varying levels of traffic.
3. Security: Implementation of strict security groups and isolation of layers to minimize exposure and potential attack vectors.
4. Automation: Infrastructure is fully managed and provisioned using Terraform, enabling quick and consistent deployments.




# Setup Instructions

## Prerequisites
1. AWS Account
2. Terraform installed
3. AWS CLI configured with appropriate permissions
4. SSH key pair for accessing EC2 instances



# Project Structure


1. variables.tf: Contains all the variables used in the Terraform scripts.
2. lampstack.sh: Bash script for setting up the PHP environment on EC2 instances.
Future Enhancements

# Future Enhancements
1. CI/CD Integration: Automate the deployment process using tools like Jenkins or GitHub Actions.
