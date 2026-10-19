resource "aws_datasync_location_object_storage" "datasync_location_object_storages" {
  for_each = var.datasync_location_object_storages

  bucket_name        = each.value.bucket_name
  server_hostname    = each.value.server_hostname
  access_key         = each.value.access_key
  agent_arns         = each.value.agent_arns
  region             = each.value.region
  secret_key         = each.value.secret_key
  server_certificate = each.value.server_certificate
  server_port        = each.value.server_port
  server_protocol    = each.value.server_protocol
  subdirectory       = each.value.subdirectory
  tags               = each.value.tags
  tags_all           = each.value.tags_all
}
