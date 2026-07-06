resource "aws_glue_dev_endpoint" "glue_dev_endpoints" {
  for_each = var.glue_dev_endpoints

  name                      = each.value.name
  role_arn                  = each.value.role_arn
  arguments                 = each.value.arguments
  extra_jars_s3_path        = each.value.extra_jars_s3_path
  extra_python_libs_s3_path = each.value.extra_python_libs_s3_path
  glue_version              = each.value.glue_version
  number_of_nodes           = each.value.number_of_nodes
  number_of_workers         = each.value.number_of_workers
  public_key                = each.value.public_key
  public_keys               = each.value.public_keys
  region                    = each.value.region
  security_configuration    = each.value.security_configuration
  security_group_ids        = each.value.security_group_ids
  subnet_id                 = each.value.subnet_id
  tags                      = each.value.tags
  tags_all                  = each.value.tags_all
  worker_type               = each.value.worker_type
}
