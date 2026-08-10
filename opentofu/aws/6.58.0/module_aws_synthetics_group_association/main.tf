resource "aws_synthetics_group_association" "synthetics_group_associations" {
  for_each = var.synthetics_group_associations

  canary_arn = each.value.canary_arn
  group_name = each.value.group_name
  region     = each.value.region
}
