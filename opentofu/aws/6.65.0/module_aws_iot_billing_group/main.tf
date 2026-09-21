resource "aws_iot_billing_group" "iot_billing_groups" {
  for_each = var.iot_billing_groups

  name   = each.value.name
  region = each.value.region
  tags   = each.value.tags

  dynamic "properties" {
    for_each = each.value.properties != null ? each.value.properties : []
    content {
      description = properties.value.description
    }
  }
}
