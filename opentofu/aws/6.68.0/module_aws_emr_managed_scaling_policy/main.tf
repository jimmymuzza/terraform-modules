resource "aws_emr_managed_scaling_policy" "emr_managed_scaling_policies" {
  for_each = var.emr_managed_scaling_policies

  cluster_id                    = each.value.cluster_id
  region                        = each.value.region
  scaling_strategy              = each.value.scaling_strategy
  utilization_performance_index = each.value.utilization_performance_index

  dynamic "compute_limits" {
    for_each = each.value.compute_limits != null ? each.value.compute_limits : []
    content {
      maximum_capacity_units          = compute_limits.value.maximum_capacity_units
      minimum_capacity_units          = compute_limits.value.minimum_capacity_units
      unit_type                       = compute_limits.value.unit_type
      maximum_core_capacity_units     = compute_limits.value.maximum_core_capacity_units
      maximum_ondemand_capacity_units = compute_limits.value.maximum_ondemand_capacity_units
    }
  }
}
