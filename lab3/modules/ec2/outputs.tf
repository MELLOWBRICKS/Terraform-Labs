output "instance_ids" {
  description = "IDs of the EC2 instances"
  value       = aws_instance.terra-1stlab[*].id
}

output "public_ips" {
  description = "Public IP addresses of the EC2 instances"
  value       = aws_instance.terra-1stlab[*].public_ip
}

output "private_ips" {
  description = "Private IP addresses of the EC2 instances"
  value       = aws_instance.terra-1stlab[*].private_ip
}

output "iam_role_arn" {
  description = "ARN of the IAM role"
  value       = aws_iam_role.ec2_s3_role.arn
}