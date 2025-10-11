# 🏗️ Terraform AWS Infrastructure Labs

[![Terraform](https://img.shields.io/badge/Terraform-v1.0+-623CE4?style=flat&logo=terraform)](https://terraform.io)
[![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900?style=flat&logo=amazon-aws)](https://aws.amazon.com)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A comprehensive collection of Terraform labs demonstrating AWS infrastructure provisioning from basic resources to advanced modular architectures.

## 📋 Overview

This repository contains three progressive Terraform labs that teach infrastructure as code concepts:

- **Lab 1**: Basic EC2 instance provisioning
- **Lab 2**: S3 bucket creation and management  
- **Lab 3**: Advanced modular infrastructure with VPC, EC2, and S3 integration

## 🗂️ Project Structure

```
terra/
├── lab1/                    # Basic EC2 instances
│   └── EC2-Instance.tf
├── lab2/                    # S3 bucket creation
│   └── S3-Bucket.tf
├── lab3/                    # Advanced modular infrastructure
│   ├── main.tf              # Main configuration
│   ├── variables.tf         # Input variables
│   ├── outputs.tf           # Output values
│   ├── providers.tf         # AWS provider setup
│   ├── backend.tf           # Remote state configuration
│   ├── TEACHME.md          # Detailed lab guide
│   └── modules/            # Reusable modules
│       ├── vpc/            # Virtual Private Cloud
│       ├── ec2/            # EC2 instances with IAM
│       └── s3/             # S3 bucket with policies
└── README.md               # This file
```

## 🚀 Quick Start

### Prerequisites

- [Terraform](https://terraform.io/downloads.html) >= 1.0
- [AWS CLI](https://aws.amazon.com/cli/) configured
- AWS credentials with appropriate permissions

### Lab 1: Basic EC2 Instances

```bash
cd lab1
terraform init
terraform plan
terraform apply
```

**Creates:**
- 2x t2.micro EC2 instances
- Basic security group configuration
- Public IP outputs

### Lab 2: S3 Bucket

```bash
cd lab2
terraform init
terraform plan
terraform apply
```

**Creates:**
- S3 bucket with tags
- Bucket ARN and name outputs

### Lab 3: Modular Infrastructure

```bash
cd lab3
terraform init
terraform plan
terraform apply
```

**Creates:**
- Modular VPC setup
- EC2 instances with IAM roles
- S3 bucket with VPC endpoint
- Security policies and networking

## 🏗️ Architecture

### Lab 3 Architecture Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                        AWS VPC                              │
│  ┌─────────────────┐    ┌─────────────────┐                │
│  │   EC2 Module    │    │   S3 Module     │                │
│  │                 │    │                 │                │
│  │ ┌─────────────┐ │    │ ┌─────────────┐ │                │
│  │ │ Instance 1  │ │    │ │   Bucket    │ │                │
│  │ │ + IAM Role  │ │◄───┤ │ + Policies  │ │                │
│  │ └─────────────┘ │    │ └─────────────┘ │                │
│  │ ┌─────────────┐ │    │                 │                │
│  │ │ Instance 2  │ │    │                 │                │
│  │ │ + IAM Role  │ │    │                 │                │
│  │ └─────────────┘ │    │                 │                │
│  └─────────────────┘    └─────────────────┘                │
│           │                       │                        │
│           └───────────────────────┼────────────────────────┤
│                                   │                        │
│                        ┌─────────────────┐                 │
│                        │  VPC Endpoint   │                 │
│                        │      (S3)       │                 │
│                        └─────────────────┘                 │
└─────────────────────────────────────────────────────────────┘
```

## 🔧 Configuration

### Environment Variables

```bash
export AWS_REGION="ap-south-1"
export AWS_PROFILE="your-profile"
```

### Key Variables (Lab 3)

| Variable | Description | Default |
|----------|-------------|---------|
| `aws_region` | AWS region | `ap-south-1` |
| `s3_bucket_name` | S3 bucket name | `terra-lab3-bucket` |
| `instance_type` | EC2 instance type | `t2.micro` |
| `key_name` | EC2 key pair name | `mells-server` |

## 📊 Outputs

### Lab 1 Outputs
- `instance_id`: EC2 instance IDs
- `elastic-ip`: Public IP addresses

### Lab 2 Outputs  
- `s3_bucket_name`: Bucket name
- `s3_bucket_arn`: Bucket ARN

### Lab 3 Outputs
- Modular outputs from each component
- VPC endpoint details
- IAM role ARNs

## 🛡️ Security Features

- **IAM Roles**: Least privilege access for EC2 instances
- **VPC Endpoints**: Private S3 access without internet gateway
- **Security Groups**: Controlled network access
- **Resource Tagging**: Consistent resource identification

## 🧪 Testing

```bash
# Validate configuration
terraform validate

# Check formatting
terraform fmt -check

# Plan without applying
terraform plan

# Destroy resources (when done)
terraform destroy
```

## 📚 Learning Path

1. **Start with Lab 1**: Learn basic Terraform syntax and EC2 provisioning
2. **Progress to Lab 2**: Understand S3 resource management
3. **Master Lab 3**: Explore modular architecture and advanced networking
