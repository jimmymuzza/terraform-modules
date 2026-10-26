resource "aws_s3control_object_lambda_access_point" "s3control_object_lambda_access_points" {
  for_each = var.s3control_object_lambda_access_points

  name       = each.value.name
  account_id = each.value.account_id
  region     = each.value.region

  dynamic "configuration" {
    for_each = each.value.configuration != null ? each.value.configuration : []
    content {
      supporting_access_point     = configuration.value.supporting_access_point
      allowed_features            = configuration.value.allowed_features
      cloud_watch_metrics_enabled = configuration.value.cloud_watch_metrics_enabled

      dynamic "transformation_configuration" {
        for_each = configuration.value.transformation_configuration != null ? configuration.value.transformation_configuration : []
        content {
          actions = transformation_configuration.value.actions

          dynamic "content_transformation" {
            for_each = transformation_configuration.value.content_transformation != null ? transformation_configuration.value.content_transformation : []
            content {

              dynamic "aws_lambda" {
                for_each = content_transformation.value.aws_lambda != null ? content_transformation.value.aws_lambda : []
                content {
                  function_arn     = aws_lambda.value.function_arn
                  function_payload = aws_lambda.value.function_payload
                }
              }
            }
          }
        }
      }
    }
  }
}
