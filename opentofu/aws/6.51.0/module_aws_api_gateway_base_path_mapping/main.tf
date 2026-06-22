resource "aws_api_gateway_base_path_mapping" "api_gateway_base_path_mappings" {
  for_each = var.api_gateway_base_path_mappings

  api_id         = each.value.api_id
  domain_name    = each.value.domain_name
  base_path      = each.value.base_path
  domain_name_id = each.value.domain_name_id
  region         = each.value.region
  stage_name     = each.value.stage_name
}
