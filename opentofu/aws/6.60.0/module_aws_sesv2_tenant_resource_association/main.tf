resource "aws_sesv2_tenant_resource_association" "sesv2_tenant_resource_associations" {
  for_each = var.sesv2_tenant_resource_associations

  resource_arn = each.value.resource_arn
  tenant_name  = each.value.tenant_name
  region       = each.value.region
}
