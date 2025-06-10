output "ec2_public_ip" {
  value = aws_instance.secure_bastion.public_ip
}

output "github_oidc_role_arn" {
  value = aws_iam_role.github_oidc_role.arn
}
