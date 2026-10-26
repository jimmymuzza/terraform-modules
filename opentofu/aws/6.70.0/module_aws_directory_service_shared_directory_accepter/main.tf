resource "aws_directory_service_shared_directory_accepter" "directory_service_shared_directory_accepters" {
  for_each = var.directory_service_shared_directory_accepters

  shared_directory_id = each.value.shared_directory_id
  region              = each.value.region
}
