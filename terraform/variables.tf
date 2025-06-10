variable "aws_region" {
  default = "us-east-1" # <-- change as needed
}

variable "ec2_instance_type" {
  default = "t3.micro"
}

variable "ec2_key_name" {
  description = "github-keypair"
}

variable "github_repo" {
  default = "gbmkocc1/act3"
}
