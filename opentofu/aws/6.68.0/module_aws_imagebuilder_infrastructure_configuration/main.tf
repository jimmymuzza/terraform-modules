resource "aws_imagebuilder_infrastructure_configuration" "imagebuilder_infrastructure_configurations" {
  for_each = var.imagebuilder_infrastructure_configurations

  instance_profile_name         = each.value.instance_profile_name
  name                          = each.value.name
  description                   = each.value.description
  instance_types                = each.value.instance_types
  key_pair                      = each.value.key_pair
  region                        = each.value.region
  resource_tags                 = each.value.resource_tags
  security_group_ids            = each.value.security_group_ids
  sns_topic_arn                 = each.value.sns_topic_arn
  subnet_id                     = each.value.subnet_id
  tags                          = each.value.tags
  tags_all                      = each.value.tags_all
  terminate_instance_on_failure = each.value.terminate_instance_on_failure

  dynamic "instance_metadata_options" {
    for_each = each.value.instance_metadata_options != null ? each.value.instance_metadata_options : []
    content {
      http_put_response_hop_limit = instance_metadata_options.value.http_put_response_hop_limit
      http_tokens                 = instance_metadata_options.value.http_tokens
    }
  }

  dynamic "logging" {
    for_each = each.value.logging != null ? each.value.logging : []
    content {

      dynamic "s3_logs" {
        for_each = logging.value.s3_logs != null ? logging.value.s3_logs : []
        content {
          s3_bucket_name = s3_logs.value.s3_bucket_name
          s3_key_prefix  = s3_logs.value.s3_key_prefix
        }
      }
    }
  }

  dynamic "placement" {
    for_each = each.value.placement != null ? each.value.placement : []
    content {
      availability_zone       = placement.value.availability_zone
      host_id                 = placement.value.host_id
      host_resource_group_arn = placement.value.host_resource_group_arn
      tenancy                 = placement.value.tenancy
    }
  }
}
