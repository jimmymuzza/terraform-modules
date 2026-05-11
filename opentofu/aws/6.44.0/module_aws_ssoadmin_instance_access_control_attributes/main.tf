resource "aws_ssoadmin_instance_access_control_attributes" "ssoadmin_instance_access_control_attributes" {
  for_each = var.ssoadmin_instance_access_control_attributes

  instance_arn = each.value.instance_arn
  region       = each.value.region

  dynamic "attribute" {
    for_each = each.value.attribute != null ? each.value.attribute : []
    content {
      key = attribute.value.key

      dynamic "value" {
        for_each = attribute.value.value != null ? attribute.value.value : []
        content {
          source = value.value.source
        }
      }
    }
  }
}
