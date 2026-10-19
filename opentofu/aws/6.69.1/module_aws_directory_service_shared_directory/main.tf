resource "aws_directory_service_shared_directory" "directory_service_shared_directories" {
  for_each = var.directory_service_shared_directories

  directory_id = each.value.directory_id
  method       = each.value.method
  notes        = each.value.notes
  region       = each.value.region

  dynamic "target" {
    for_each = each.value.target != null ? each.value.target : []
    content {
      type = target.value.type
    }
  }
}
