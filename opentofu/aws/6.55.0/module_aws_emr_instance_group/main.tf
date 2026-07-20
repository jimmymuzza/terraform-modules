resource "aws_emr_instance_group" "emr_instance_groups" {
  for_each = var.emr_instance_groups

  cluster_id          = each.value.cluster_id
  instance_type       = each.value.instance_type
  autoscaling_policy  = each.value.autoscaling_policy
  bid_price           = each.value.bid_price
  configurations_json = each.value.configurations_json
  ebs_optimized       = each.value.ebs_optimized
  instance_count      = each.value.instance_count
  name                = each.value.name
  region              = each.value.region

  dynamic "ebs_config" {
    for_each = each.value.ebs_config != null ? each.value.ebs_config : []
    content {
      size                 = ebs_config.value.size
      type                 = ebs_config.value.type
      iops                 = ebs_config.value.iops
      volumes_per_instance = ebs_config.value.volumes_per_instance
    }
  }
}
