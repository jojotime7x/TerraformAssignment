Author : Sathish Jonnalagadda
Created Date : 17-02-2024



## Overview

The configuration provisions the following resources:
- A VPC with a CIDR block of `10.0.0.0/16`.
- Two public subnets with CIDR blocks of `10.0.1.0/24` and `10.0.2.0/24`.
- Two private subnets with CIDR blocks of `10.0.3.0/24` and `10.0.4.0/24`.
- EC2 instances for running an Nginx server, using a pre-existing key pair for SSH access.

## Prerequisites

- AWS Account: You need an active AWS account.
- AWS CLI: Configured with access key, secret key, and default region.
- Terraform: Version 1.0.0 or later installed on your machine.
- SSH Key Pair: A key pair named `name` created in the AWS EC2 console or through the AWS CLI.

## Variables

The configuration uses the following variables:

- `vpc_cidr`: The CIDR block for the VPC.
- `public_subnet_cidr`: CIDR blocks for the public subnets.
- `private_subnet_cidr`: CIDR blocks for the private subnets.
- `key_name`: The name of the SSH key pair for EC2 instances.
- `ec2_names`: Names of the EC2 instances to be created.
- `public_subnets`: Names of the public subnets for identification.
- `private_subnets`: Names of the private subnets for identification.
- `env_prefix`: A prefix used for naming resources, indicating the environment.
- `instance_type`: The instance type for the EC2 instances.



# Terraform AWS Infrastructure Setup


## File Structure
```
TerraformAssignment/
├── LICENSE
├── README.md
├── .github/
│   ├── actions/
│   │   └── send-notification/
│   │       ├── action.yml       # Action definition for sending notifications.
│   │       ├── Dockerfile       # Dockerfile for the send-notification action.
│   │       └── entrypoint.sh    # Entry point script for the send-notification action.
│   └── workflows/
│       └── deploy.yml           # CI/CD workflow definition for Terraform deployment.
└── Terraform-Assignment/
    ├── .gitignore
    ├── main.tf                  # Main Terraform configuration file.
    ├── provider.tf              # Terraform provider configuration.
    ├── terraform.tfvars         # Terraform variables definition.
    ├── variables.tf             # Terraform variable declarations.
    ├── modules/                 # Terraform modules.
    │   ├── ec2/                 # EC2 module with configuration and variables.
    │   ├── vpc/                 # VPC module with configuration and variables.
    │   └── Web_SecurityGroup/   # Security group module with configuration and variables.
    └── user_data/               # User data scripts for EC2 instances.
        └── nginx_userdata.sh    # Nginx setup script for EC2 instances.


```
The above file Structure follows the modular and resuable and standard  format for further usablity.


Note the Subnets, IGW and NAT is not declared as separate module, can be declared separately as other modules like ec2, vpc, and web_securityGroup for further resubality and quality

Here's a sample README.md content for your project setup, including the GitHub Actions workflow and Terraform infrastructure deployment:

---

# Terraform AWS Deployment

This project automates the deployment of AWS resources using Terraform within a CI/CD pipeline implemented via GitHub Actions. It includes the provisioning of EC2 instances, VPC configurations, and security groups, with dynamic notifications sent to a Slack channel upon deployment outcomes.

## GitHub Actions CI/CD Pipeline

The CI/CD pipeline is managed through GitHub Actions, defined in `.github/workflows/deploy.yml`. It performs the following steps on each push to the repository:

- Initializes Terraform.
- Validates the Terraform configuration.
- Plans the deployment.
- Applies the changes to deploy the infrastructure.
- Sends a notification to Slack with the deployment outcome.

### Required Secrets

Set the following secrets in your GitHub repository to enable the workflow:

- `AWS_ACCESS_KEY_ID`: Your AWS access key.
- `AWS_SECRET_ACCESS_KEY`: Your AWS secret access key.
- `SLACK_WEBHOOK_URL`: The Webhook URL for Slack notifications.
- `DESTROY_INFRA `: Set to 'true' if you want to enable automatic destruction of the deployed infrastructure as part of the CI/CD process. This is optional and should be used with caution.

### Slack Notifications

To receive notifications about the deployment status, create a Slack app and configure an incoming webhook in your desired Slack workspace/channel. Set the webhook URL as a secret (`SLACK_WEBHOOK_URL`) in your GitHub repository.

## Terraform Configuration

Terraform is used to define the infrastructure within AWS. The configuration files are located under the `Terraform-Assignment` directory. Before running the GitHub Actions workflow, ensure that your `terraform.tfvars` file contains the necessary variables for your AWS setup.

## Deployment

To deploy the infrastructure:

1. Push changes to the repository to trigger the GitHub Actions workflow.
2. Monitor the workflow execution in the Actions tab of your GitHub repository.
3. Check the Slack channel for notifications regarding the deployment status.



Below is the screenshot of job successful

![notification hook](notification-hook.png)


## destroy

To destroy the resources

By Default the secret store is 'true' in the deploy.yaml
env.DESTROY_INFRA == 'false'
false based on your requirments i will set false to not destroy and true to destroy


      - name: Optionally Destroy Infrastructure
        if: env.DESTROY_INFRA == 'true' 
        run: terraform destroy --auto-approve
        working-directory: ./Terraform-Assignment
        # Conditionally destroys the Terraform-managed infrastructure based on the DESTROY_INFRA variable.

This Terraform configuration sets up a basic AWS infrastructure, including a Virtual Private Cloud (VPC), public and private subnets, and EC2 instances within the AWS Cloud. This setup is designed for educational or development purposes and should be customized for production environments.











