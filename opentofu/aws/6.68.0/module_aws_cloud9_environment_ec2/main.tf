resource "aws_cloud9_environment_ec2" "cloud9_environment_ec2s" {
  for_each = var.cloud9_environment_ec2s

  image_id                    = each.value.image_id
  instance_type               = each.value.instance_type
  name                        = each.value.name
  automatic_stop_time_minutes = each.value.automatic_stop_time_minutes
  connection_type             = each.value.connection_type
  description                 = each.value.description
  owner_arn                   = each.value.owner_arn
  region                      = each.value.region
  subnet_id                   = each.value.subnet_id
  tags                        = each.value.tags
  tags_all                    = each.value.tags_all
}
