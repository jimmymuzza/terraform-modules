resource "aws_synthetics_group" "synthetics_groups" {
  for_each = var.synthetics_groups

  name     = each.value.name
  region   = each.value.region
  tags     = each.value.tags
  tags_all = each.value.tags_all
}
