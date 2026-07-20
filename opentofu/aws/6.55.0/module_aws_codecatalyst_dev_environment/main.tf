resource "aws_codecatalyst_dev_environment" "codecatalyst_dev_environments" {
  for_each = var.codecatalyst_dev_environments

  instance_type              = each.value.instance_type
  project_name               = each.value.project_name
  space_name                 = each.value.space_name
  alias                      = each.value.alias
  inactivity_timeout_minutes = each.value.inactivity_timeout_minutes
  region                     = each.value.region

  dynamic "ides" {
    for_each = each.value.ides != null ? each.value.ides : []
    content {
      name    = ides.value.name
      runtime = ides.value.runtime
    }
  }

  dynamic "persistent_storage" {
    for_each = each.value.persistent_storage != null ? each.value.persistent_storage : []
    content {
      size = persistent_storage.value.size
    }
  }

  dynamic "repositories" {
    for_each = each.value.repositories != null ? each.value.repositories : []
    content {
      repository_name = repositories.value.repository_name
      branch_name     = repositories.value.branch_name
    }
  }
}
