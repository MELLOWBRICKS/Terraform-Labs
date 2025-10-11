provider "aws" {
    region = "ap-south-1"
    # access_key = ACCESS_KEY
    # secret_key = SECRET_KEY
}

resource "aws_s3_bucket" "terra-lab2-bucket" {
    bucket = "terra-lab2-bucket"
    
    tags = {
        Name = "terra-lab2-bucket"
        project = "terraform"
        Environment = "lab"
    }
}


output "s3_bucket_name" {
    value = aws_s3_bucket.terra-lab2-bucket.bucket
}

output "s3_bucket_arn" {
    value = aws_s3_bucket.terra-lab2-bucket.arn
}