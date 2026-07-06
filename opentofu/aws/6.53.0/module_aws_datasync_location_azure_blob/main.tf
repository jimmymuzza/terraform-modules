resource "aws_datasync_location_azure_blob" "datasync_location_azure_blobs" {
  for_each = var.datasync_location_azure_blobs

  agent_arns          = each.value.agent_arns
  authentication_type = each.value.authentication_type
  container_url       = each.value.container_url
  access_tier         = each.value.access_tier
  blob_type           = each.value.blob_type
  region              = each.value.region
  subdirectory        = each.value.subdirectory
  tags                = each.value.tags
  tags_all            = each.value.tags_all

  dynamic "sas_configuration" {
    for_each = each.value.sas_configuration != null ? each.value.sas_configuration : []
    content {
      token = sas_configuration.value.token
    }
  }
}
