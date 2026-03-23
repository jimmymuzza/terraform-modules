resource "aws_opensearch_application" "opensearch_applications" {
  for_each = var.opensearch_applications

  name        = each.value.name
  kms_key_arn = each.value.kms_key_arn
  region      = each.value.region
  tags        = each.value.tags

  dynamic "app_config" {
    for_each = each.value.app_config != null ? each.value.app_config : []
    content {
      key   = app_config.value.key
      value = app_config.value.value
    }
  }

  dynamic "data_source" {
    for_each = each.value.data_source != null ? each.value.data_source : []
    content {
      data_source_arn         = data_source.value.data_source_arn
      data_source_description = data_source.value.data_source_description
    }
  }

  dynamic "iam_identity_center_options" {
    for_each = each.value.iam_identity_center_options != null ? each.value.iam_identity_center_options : []
    content {
      enabled                                      = iam_identity_center_options.value.enabled
      iam_identity_center_instance_arn             = iam_identity_center_options.value.iam_identity_center_instance_arn
      iam_role_for_identity_center_application_arn = iam_identity_center_options.value.iam_role_for_identity_center_application_arn
    }
  }
}
