resource "aws_sesv2_tenant" "sesv2_tenants" {
  for_each = var.sesv2_tenants

  tenant_name = each.value.tenant_name
  region      = each.value.region
  tags        = each.value.tags
}
