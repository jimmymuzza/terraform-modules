resource "aws_osis_pipeline_endpoint" "osis_pipeline_endpoints" {
  for_each = var.osis_pipeline_endpoints

  pipeline_arn = each.value.pipeline_arn
  region       = each.value.region

  dynamic "vpc_options" {
    for_each = each.value.vpc_options != null ? each.value.vpc_options : []
    content {
      subnet_ids         = vpc_options.value.subnet_ids
      security_group_ids = vpc_options.value.security_group_ids
    }
  }
}
