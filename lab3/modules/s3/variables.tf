variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "terra-lab2-bucket"
}

variable "vpc_endpoint_id" {
  description = "VPC Endpoint ID for S3"
  type        = string
}

variable "environment" {
  description = "Environment tag for the bucket"
  type        = string
  default     = "lab"
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}