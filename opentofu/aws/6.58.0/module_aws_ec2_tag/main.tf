resource "aws_ec2_tag" "ec2_tags" {
  for_each = var.ec2_tags

  key         = each.value.key
  resource_id = each.value.resource_id
  value       = each.value.value
  region      = each.value.region
}
