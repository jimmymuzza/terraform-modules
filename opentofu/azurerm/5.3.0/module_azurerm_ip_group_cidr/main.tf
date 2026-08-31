resource "azurerm_ip_group_cidr" "ip_group_cidrs" {
  for_each = var.ip_group_cidrs

  cidr        = each.value.cidr
  ip_group_id = each.value.ip_group_id
}
