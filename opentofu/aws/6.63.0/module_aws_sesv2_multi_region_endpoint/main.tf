resource "aws_sesv2_multi_region_endpoint" "sesv2_multi_region_endpoints" {
  for_each = var.sesv2_multi_region_endpoints

  endpoint_name = each.value.endpoint_name
  region        = each.value.region
  tags          = each.value.tags

  dynamic "details" {
    for_each = each.value.details != null ? each.value.details : []
    content {

      dynamic "routes_details" {
        for_each = details.value.routes_details != null ? details.value.routes_details : []
        content {
          region = routes_details.value.region
        }
      }
    }
  }
}
