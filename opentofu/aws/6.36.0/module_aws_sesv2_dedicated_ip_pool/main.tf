resource "aws_sesv2_dedicated_ip_pool" "sesv2_dedicated_ip_pools" {
  for_each = var.sesv2_dedicated_ip_pools

  pool_name    = each.value.pool_name
  region       = each.value.region
  scaling_mode = each.value.scaling_mode
  tags         = each.value.tags
  tags_all     = each.value.tags_all
}
