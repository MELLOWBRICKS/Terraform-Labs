variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "EC2 Key Pair name"
  type        = string
  default     = "mells-server"
}

variable "s3_bucket_name" {
  description = "S3 bucket name"
  type        = string
  default     = "my-terraform-homework-bucket"
}

variable "default_subnet_id" {
  description = "Default subnet ID to use for EC2 instances"
  type        = string
  default     = "subnet-0a342bfe18f26d960"  # Your original subnet ID
}

variable "default_security_group_id" {
  description = "Default security group ID to use for EC2 instances"
  type        = string
  default     = "sg-07d6c26936cecaa2e"  # Your original security group ID
}

variable "common_tags" {
  description = "Common tags to be applied to all resources"
  type        = map(string)
  default = {
    Project     = "terraform-homework"
    Environment = "dev"
  }
}