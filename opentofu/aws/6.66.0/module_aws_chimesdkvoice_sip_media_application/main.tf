resource "aws_chimesdkvoice_sip_media_application" "chimesdkvoice_sip_media_applications" {
  for_each = var.chimesdkvoice_sip_media_applications

  aws_region = each.value.aws_region
  name       = each.value.name
  region     = each.value.region
  tags       = each.value.tags
  tags_all   = each.value.tags_all

  dynamic "endpoints" {
    for_each = each.value.endpoints != null ? each.value.endpoints : []
    content {
      lambda_arn = endpoints.value.lambda_arn
    }
  }
}
