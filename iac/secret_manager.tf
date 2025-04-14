resource "aws_secretsmanager_secret" "secret_ec2" {
  name = "instance_id"

  tags = var.tags
}