resource "aws_computeoptimizer_recommendation_preferences" "computeoptimizer_recommendation_preferences" {
  for_each = var.computeoptimizer_recommendation_preferences

  resource_type                   = each.value.resource_type
  enhanced_infrastructure_metrics = each.value.enhanced_infrastructure_metrics
  inferred_workload_types         = each.value.inferred_workload_types
  look_back_period                = each.value.look_back_period
  region                          = each.value.region
  savings_estimation_mode         = each.value.savings_estimation_mode

  dynamic "external_metrics_preference" {
    for_each = each.value.external_metrics_preference != null ? each.value.external_metrics_preference : []
    content {
      source = external_metrics_preference.value.source
    }
  }

  dynamic "preferred_resource" {
    for_each = each.value.preferred_resource != null ? each.value.preferred_resource : []
    content {
      name         = preferred_resource.value.name
      exclude_list = preferred_resource.value.exclude_list
      include_list = preferred_resource.value.include_list
    }
  }

  dynamic "scope" {
    for_each = each.value.scope != null ? each.value.scope : []
    content {
      name  = scope.value.name
      value = scope.value.value
    }
  }

  dynamic "utilization_preference" {
    for_each = each.value.utilization_preference != null ? each.value.utilization_preference : []
    content {
      metric_name = utilization_preference.value.metric_name

      dynamic "metric_parameters" {
        for_each = utilization_preference.value.metric_parameters != null ? utilization_preference.value.metric_parameters : []
        content {
          headroom  = metric_parameters.value.headroom
          threshold = metric_parameters.value.threshold
        }
      }
    }
  }
}
