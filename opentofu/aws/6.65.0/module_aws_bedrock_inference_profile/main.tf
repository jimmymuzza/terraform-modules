resource "aws_bedrock_inference_profile" "bedrock_inference_profiles" {
  for_each = var.bedrock_inference_profiles

  name        = each.value.name
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags

  dynamic "model_source" {
    for_each = each.value.model_source != null ? each.value.model_source : []
    content {
      copy_from = model_source.value.copy_from
    }
  }
}
