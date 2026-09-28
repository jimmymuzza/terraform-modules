resource "aws_network_acl" "network_acls" {
  for_each = var.network_acls

  vpc_id     = each.value.vpc_id
  egress     = each.value.egress
  ingress    = each.value.ingress
  region     = each.value.region
  subnet_ids = each.value.subnet_ids
  tags       = each.value.tags
  tags_all   = each.value.tags_all
}
