resource "aws_bedrockagentcore_workload_identity" "bedrockagentcore_workload_identities" {
  for_each = var.bedrockagentcore_workload_identities

  name                                = each.value.name
  allowed_resource_oauth2_return_urls = each.value.allowed_resource_oauth2_return_urls
  region                              = each.value.region
}
