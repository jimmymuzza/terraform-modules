resource "aws_fsx_file_cache" "fsx_file_caches" {
  for_each = var.fsx_file_caches

  file_cache_type                           = each.value.file_cache_type
  file_cache_type_version                   = each.value.file_cache_type_version
  storage_capacity                          = each.value.storage_capacity
  subnet_ids                                = each.value.subnet_ids
  copy_tags_to_data_repository_associations = each.value.copy_tags_to_data_repository_associations
  kms_key_id                                = each.value.kms_key_id
  region                                    = each.value.region
  security_group_ids                        = each.value.security_group_ids
  tags                                      = each.value.tags
  tags_all                                  = each.value.tags_all

  dynamic "data_repository_association" {
    for_each = each.value.data_repository_association != null ? each.value.data_repository_association : []
    content {
      data_repository_path           = data_repository_association.value.data_repository_path
      file_cache_path                = data_repository_association.value.file_cache_path
      data_repository_subdirectories = data_repository_association.value.data_repository_subdirectories
      tags                           = data_repository_association.value.tags

      dynamic "nfs" {
        for_each = data_repository_association.value.nfs != null ? data_repository_association.value.nfs : []
        content {
          version = nfs.value.version
          dns_ips = nfs.value.dns_ips
        }
      }
    }
  }

  dynamic "lustre_configuration" {
    for_each = each.value.lustre_configuration != null ? each.value.lustre_configuration : []
    content {
      deployment_type               = lustre_configuration.value.deployment_type
      per_unit_storage_throughput   = lustre_configuration.value.per_unit_storage_throughput
      weekly_maintenance_start_time = lustre_configuration.value.weekly_maintenance_start_time

      dynamic "metadata_configuration" {
        for_each = lustre_configuration.value.metadata_configuration != null ? lustre_configuration.value.metadata_configuration : []
        content {
          storage_capacity = metadata_configuration.value.storage_capacity
        }
      }
    }
  }
}
