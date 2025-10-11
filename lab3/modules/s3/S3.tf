resource "aws_s3_bucket" "terra-lab2-bucket" {
  bucket = var.bucket_name

  tags = merge(var.tags, {
    Name        = var.bucket_name
    project     = "terraform"
    Environment = var.environment
  })
}

# Bucket policy to deny all access except through VPC endpoint
resource "aws_s3_bucket_policy" "deny_public_access" {
  bucket = aws_s3_bucket.terra-lab2-bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "DenyAllExceptVPCEndpoint"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          aws_s3_bucket.terra-lab2-bucket.arn,
          "${aws_s3_bucket.terra-lab2-bucket.arn}/*"
        ]
        Condition = {
          StringNotEquals = {
            "aws:sourceVpce" = var.vpc_endpoint_id
          }
        }
      }
    ]
  })
}
