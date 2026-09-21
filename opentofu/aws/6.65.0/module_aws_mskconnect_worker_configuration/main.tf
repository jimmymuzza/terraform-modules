resource "aws_mskconnect_worker_configuration" "mskconnect_worker_configurations" {
  for_each = var.mskconnect_worker_configurations

  name                    = each.value.name
  properties_file_content = each.value.properties_file_content
  description             = each.value.description
  region                  = each.value.region
  tags                    = each.value.tags
  tags_all                = each.value.tags_all
}
