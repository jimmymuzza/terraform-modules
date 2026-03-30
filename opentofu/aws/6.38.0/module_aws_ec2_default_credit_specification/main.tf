resource "aws_ec2_default_credit_specification" "ec2_default_credit_specifications" {
  for_each = var.ec2_default_credit_specifications

  cpu_credits     = each.value.cpu_credits
  instance_family = each.value.instance_family
  region          = each.value.region
}
