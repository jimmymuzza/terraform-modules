resource "aws_dms_migration_project" "dms_migration_projects" {
  for_each = var.dms_migration_projects

  instance_profile_arn = each.value.instance_profile_arn
  description          = each.value.description
  name                 = each.value.name
  region               = each.value.region
  tags                 = each.value.tags
  transformation_rules = each.value.transformation_rules

  dynamic "schema_conversion_application_attributes" {
    for_each = each.value.schema_conversion_application_attributes != null ? each.value.schema_conversion_application_attributes : []
    content {
      s3_bucket_path     = schema_conversion_application_attributes.value.s3_bucket_path
      s3_bucket_role_arn = schema_conversion_application_attributes.value.s3_bucket_role_arn
    }
  }

  dynamic "source_data_provider_descriptor" {
    for_each = each.value.source_data_provider_descriptor != null ? each.value.source_data_provider_descriptor : []
    content {
      data_provider_arn               = source_data_provider_descriptor.value.data_provider_arn
      secrets_manager_access_role_arn = source_data_provider_descriptor.value.secrets_manager_access_role_arn
      secrets_manager_secret_id       = source_data_provider_descriptor.value.secrets_manager_secret_id
    }
  }

  dynamic "target_data_provider_descriptor" {
    for_each = each.value.target_data_provider_descriptor != null ? each.value.target_data_provider_descriptor : []
    content {
      data_provider_arn               = target_data_provider_descriptor.value.data_provider_arn
      secrets_manager_access_role_arn = target_data_provider_descriptor.value.secrets_manager_access_role_arn
      secrets_manager_secret_id       = target_data_provider_descriptor.value.secrets_manager_secret_id
    }
  }
}
