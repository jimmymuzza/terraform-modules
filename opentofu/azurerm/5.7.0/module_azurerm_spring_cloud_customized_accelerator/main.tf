resource "azurerm_spring_cloud_customized_accelerator" "spring_cloud_customized_accelerators" {
  for_each = var.spring_cloud_customized_accelerators

  name                        = each.value.name
  spring_cloud_accelerator_id = each.value.spring_cloud_accelerator_id
  accelerator_tags            = each.value.accelerator_tags
  accelerator_type            = each.value.accelerator_type
  description                 = each.value.description
  display_name                = each.value.display_name
  icon_url                    = each.value.icon_url

  dynamic "git_repository" {
    for_each = each.value.git_repository != null ? each.value.git_repository : []
    content {
      url                 = git_repository.value.url
      branch              = git_repository.value.branch
      ca_certificate_id   = git_repository.value.ca_certificate_id
      commit              = git_repository.value.commit
      git_tag             = git_repository.value.git_tag
      interval_in_seconds = git_repository.value.interval_in_seconds
      path                = git_repository.value.path

      dynamic "basic_auth" {
        for_each = git_repository.value.basic_auth != null ? git_repository.value.basic_auth : []
        content {
          password = basic_auth.value.password
          username = basic_auth.value.username
        }
      }

      dynamic "ssh_auth" {
        for_each = git_repository.value.ssh_auth != null ? git_repository.value.ssh_auth : []
        content {
          private_key        = ssh_auth.value.private_key
          host_key           = ssh_auth.value.host_key
          host_key_algorithm = ssh_auth.value.host_key_algorithm
        }
      }
    }
  }
}
