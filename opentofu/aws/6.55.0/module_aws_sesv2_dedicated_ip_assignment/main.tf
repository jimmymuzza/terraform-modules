resource "aws_sesv2_dedicated_ip_assignment" "sesv2_dedicated_ip_assignments" {
  for_each = var.sesv2_dedicated_ip_assignments

  destination_pool_name = each.value.destination_pool_name
  ip                    = each.value.ip
  region                = each.value.region
}
