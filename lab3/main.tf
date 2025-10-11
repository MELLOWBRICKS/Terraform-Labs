# Main Terraform configuration for homework assignment

# S3 Module
module "s3" {
  source = "./modules/s3"

  bucket_name     = var.s3_bucket_name
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  tags            = var.common_tags
}

# Get VPC ID from subnet
data "aws_subnet" "selected" {
  id = var.default_subnet_id
}

# Get all route tables for the VPC
data "aws_route_tables" "vpc_route_tables" {
  vpc_id = data.aws_subnet.selected.vpc_id
}

# VPC Endpoint for S3 (Gateway type for truly private access)
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = data.aws_subnet.selected.vpc_id
  service_name      = "com.amazonaws.${var.aws_region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = data.aws_route_tables.vpc_route_tables.ids
  
  tags = merge(var.common_tags, {
    Name = "s3-vpc-endpoint"
  })
}

# EC2 Module (using default VPC and your original subnet/security group)
module "ec2" {
  source = "./modules/ec2"

  s3_bucket_arn     = module.s3.s3_bucket_arn
  instance_type     = var.instance_type
  key_name          = var.key_name
  subnet_id         = var.default_subnet_id
  security_group_id = var.default_security_group_id

  tags = var.common_tags
}
