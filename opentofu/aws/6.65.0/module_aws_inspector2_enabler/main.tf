resource "aws_inspector2_enabler" "inspector2_enablers" {
  for_each = var.inspector2_enablers

  account_ids    = each.value.account_ids
  resource_types = each.value.resource_types
  region         = each.value.region
}
