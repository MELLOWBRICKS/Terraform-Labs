provider "aws" {
    region = "ap-south-1"
    # access_key = ACCESS_KEY
    # secret_key = SECRET_KEY
}

resource "aws_instance" "terra-1stlab" {
    ami = "ami-02d26659fd82cf299"
    count = 2
    instance_type ="t2.micro"
    key_name = "mells-server"
    tags = {
        Name = "terra-1stlab-${count.index + 1}"
        project = "terraform"
    }
    subnet_id = "subnet-0a342bfe18f26d960"
    vpc_security_group_ids = ["sg-07d6c26936cecaa2e"]
}

output "instance_id" {
    value = aws_instance.terra-1stlab[*].id
}

output "elastic-ip" {
    value = aws_instance.terra-1stlab[*].public_ip
}