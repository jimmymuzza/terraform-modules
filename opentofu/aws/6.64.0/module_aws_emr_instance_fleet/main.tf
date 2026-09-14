resource "aws_emr_instance_fleet" "emr_instance_fleets" {
  for_each = var.emr_instance_fleets

  cluster_id                = each.value.cluster_id
  name                      = each.value.name
  region                    = each.value.region
  target_on_demand_capacity = each.value.target_on_demand_capacity
  target_spot_capacity      = each.value.target_spot_capacity

  dynamic "instance_type_configs" {
    for_each = each.value.instance_type_configs != null ? each.value.instance_type_configs : []
    content {
      instance_type                              = instance_type_configs.value.instance_type
      bid_price                                  = instance_type_configs.value.bid_price
      bid_price_as_percentage_of_on_demand_price = instance_type_configs.value.bid_price_as_percentage_of_on_demand_price
      weighted_capacity                          = instance_type_configs.value.weighted_capacity

      dynamic "configurations" {
        for_each = instance_type_configs.value.configurations != null ? instance_type_configs.value.configurations : []
        content {
          classification = configurations.value.classification
          properties     = configurations.value.properties
        }
      }

      dynamic "ebs_config" {
        for_each = instance_type_configs.value.ebs_config != null ? instance_type_configs.value.ebs_config : []
        content {
          size                 = ebs_config.value.size
          type                 = ebs_config.value.type
          iops                 = ebs_config.value.iops
          volumes_per_instance = ebs_config.value.volumes_per_instance
        }
      }
    }
  }

  dynamic "launch_specifications" {
    for_each = each.value.launch_specifications != null ? each.value.launch_specifications : []
    content {

      dynamic "on_demand_specification" {
        for_each = launch_specifications.value.on_demand_specification != null ? launch_specifications.value.on_demand_specification : []
        content {
          allocation_strategy = on_demand_specification.value.allocation_strategy
        }
      }

      dynamic "spot_specification" {
        for_each = launch_specifications.value.spot_specification != null ? launch_specifications.value.spot_specification : []
        content {
          allocation_strategy      = spot_specification.value.allocation_strategy
          timeout_action           = spot_specification.value.timeout_action
          timeout_duration_minutes = spot_specification.value.timeout_duration_minutes
          block_duration_minutes   = spot_specification.value.block_duration_minutes
        }
      }
    }
  }
}
