resource "aws_vpc_ipam_scope" "vpc_ipam_scopes" {
  for_each = var.vpc_ipam_scopes

  ipam_id     = each.value.ipam_id
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all
}
