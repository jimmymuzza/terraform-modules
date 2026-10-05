resource "aws_qbusiness_application" "qbusiness_applications" {
  for_each = var.qbusiness_applications

  display_name                 = each.value.display_name
  iam_service_role_arn         = each.value.iam_service_role_arn
  identity_center_instance_arn = each.value.identity_center_instance_arn
  description                  = each.value.description
  region                       = each.value.region
  tags                         = each.value.tags

  dynamic "attachments_configuration" {
    for_each = each.value.attachments_configuration != null ? each.value.attachments_configuration : []
    content {
      attachments_control_mode = attachments_configuration.value.attachments_control_mode
    }
  }

  dynamic "encryption_configuration" {
    for_each = each.value.encryption_configuration != null ? each.value.encryption_configuration : []
    content {
      kms_key_id = encryption_configuration.value.kms_key_id
    }
  }
}
