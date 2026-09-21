resource "aws_evidently_project" "evidently_projects" {
  for_each = var.evidently_projects

  name        = each.value.name
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "data_delivery" {
    for_each = each.value.data_delivery != null ? each.value.data_delivery : []
    content {

      dynamic "cloudwatch_logs" {
        for_each = data_delivery.value.cloudwatch_logs != null ? data_delivery.value.cloudwatch_logs : []
        content {
          log_group = cloudwatch_logs.value.log_group
        }
      }

      dynamic "s3_destination" {
        for_each = data_delivery.value.s3_destination != null ? data_delivery.value.s3_destination : []
        content {
          bucket = s3_destination.value.bucket
          prefix = s3_destination.value.prefix
        }
      }
    }
  }
}
