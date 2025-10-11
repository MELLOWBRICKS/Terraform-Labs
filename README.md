# Terraform Homework Assignment

This Terraform configuration creates the infrastructure as specified in the homework requirements:

## Architecture

- **VPC** with 4 subnets:
  - 2 Public subnets (with Internet Gateway access)
  - 2 Private subnets (with NAT Gateway access)
- **EC2 instances** deployed in private subnets
- **S3 bucket** for storage
- **IAM role** allowing EC2 instances to access S3 bucket privately

## Prerequisites

1. AWS CLI configured with appropriate credentials
2. Terraform installed (version >= 1.0)
3. An existing EC2 Key Pair in your AWS account

## Deployment Instructions

1. **Clone and navigate to the project directory**

2. **Copy the example variables file:**

   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

3. **Edit terraform.tfvars:**

   - Update `key_name` to your actual EC2 key pair name
   - Update `s3_bucket_name` to a globally unique name
   - Modify other variables as needed

4. **Initialize Terraform:**

   ```bash
   terraform init
   ```

5. **Plan the deployment:**

   ```bash
   terraform plan
   ```

6. **Apply the configuration:**

   ```bash
   terraform apply
   ```

7. **Verify the deployment:**
   ```bash
   terraform output
   ```

## Testing S3 Access from EC2

Once deployed, you can test the S3 access from EC2 instances:

1. Connect to an EC2 instance (you'll need a bastion host or VPN for private instances)
2. Test S3 access:
   ```bash
   aws s3 ls s3://your-bucket-name
   aws s3 cp /etc/hostname s3://your-bucket-name/test-file.txt
   ```

## Cleanup

To destroy all resources:

```bash
terraform destroy
```

## Module Structure

```
├── main.tf                 # Main configuration
├── variables.tf            # Input variables
├── outputs.tf             # Output values
├── terraform.tfvars.example # Example variables
├── modules/
│   ├── vpc/               # VPC module
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── ec2/               # EC2 module
│   │   ├── EC2.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── s3/                # S3 module
│       ├── S3.tf
│       ├── variables.tf
│       └── outputs.tf
```

## Features Implemented

✅ VPC with 4 subnets (2 public, 2 private)  
✅ EC2 instances in private subnets  
✅ S3 bucket with security configurations  
✅ IAM role for EC2 to S3 access  
✅ Security groups with appropriate rules  
✅ NAT Gateways for private subnet internet access  
✅ Modular Terraform structure
