resource "aws_directory_service_directory_setting" "directory_service_directory_settings" {
  for_each = var.directory_service_directory_settings

  directory_id = each.value.directory_id
  name         = each.value.name
  value        = each.value.value
  region       = each.value.region
}
