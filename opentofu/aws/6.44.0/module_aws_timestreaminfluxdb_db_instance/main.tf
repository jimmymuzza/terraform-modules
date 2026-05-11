resource "aws_timestreaminfluxdb_db_instance" "timestreaminfluxdb_db_instances" {
  for_each = var.timestreaminfluxdb_db_instances

  allocated_storage             = each.value.allocated_storage
  bucket                        = each.value.bucket
  db_instance_type              = each.value.db_instance_type
  name                          = each.value.name
  organization                  = each.value.organization
  password                      = each.value.password
  username                      = each.value.username
  vpc_security_group_ids        = each.value.vpc_security_group_ids
  vpc_subnet_ids                = each.value.vpc_subnet_ids
  db_parameter_group_identifier = each.value.db_parameter_group_identifier
  db_storage_type               = each.value.db_storage_type
  deployment_type               = each.value.deployment_type
  network_type                  = each.value.network_type
  port                          = each.value.port
  publicly_accessible           = each.value.publicly_accessible
  region                        = each.value.region
  tags                          = each.value.tags

  dynamic "log_delivery_configuration" {
    for_each = each.value.log_delivery_configuration != null ? each.value.log_delivery_configuration : []
    content {

      dynamic "s3_configuration" {
        for_each = log_delivery_configuration.value.s3_configuration != null ? log_delivery_configuration.value.s3_configuration : []
        content {
          bucket_name = s3_configuration.value.bucket_name
          enabled     = s3_configuration.value.enabled
        }
      }
    }
  }
}
