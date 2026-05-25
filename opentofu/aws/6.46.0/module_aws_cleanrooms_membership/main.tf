resource "aws_cleanrooms_membership" "cleanrooms_memberships" {
  for_each = var.cleanrooms_memberships

  collaboration_id = each.value.collaboration_id
  query_log_status = each.value.query_log_status
  region           = each.value.region
  tags             = each.value.tags

  dynamic "default_result_configuration" {
    for_each = each.value.default_result_configuration != null ? each.value.default_result_configuration : []
    content {
      role_arn = default_result_configuration.value.role_arn

      dynamic "output_configuration" {
        for_each = default_result_configuration.value.output_configuration != null ? default_result_configuration.value.output_configuration : []
        content {

          dynamic "s3" {
            for_each = output_configuration.value.s3 != null ? output_configuration.value.s3 : []
            content {
              bucket        = s3.value.bucket
              result_format = s3.value.result_format
              key_prefix    = s3.value.key_prefix
            }
          }
        }
      }
    }
  }

  dynamic "payment_configuration" {
    for_each = each.value.payment_configuration != null ? each.value.payment_configuration : []
    content {

      dynamic "query_compute" {
        for_each = payment_configuration.value.query_compute != null ? payment_configuration.value.query_compute : []
        content {
          is_responsible = query_compute.value.is_responsible
        }
      }
    }
  }
}
