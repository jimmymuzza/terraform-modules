resource "aws_sagemaker_hub" "sagemaker_hubs" {
  for_each = var.sagemaker_hubs

  hub_description     = each.value.hub_description
  hub_name            = each.value.hub_name
  hub_display_name    = each.value.hub_display_name
  hub_search_keywords = each.value.hub_search_keywords
  region              = each.value.region
  tags                = each.value.tags
  tags_all            = each.value.tags_all

  dynamic "s3_storage_config" {
    for_each = each.value.s3_storage_config != null ? each.value.s3_storage_config : []
    content {
      s3_output_path = s3_storage_config.value.s3_output_path
    }
  }
}
