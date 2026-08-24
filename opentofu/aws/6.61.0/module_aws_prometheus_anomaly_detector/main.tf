resource "aws_prometheus_anomaly_detector" "prometheus_anomaly_detectors" {
  for_each = var.prometheus_anomaly_detectors

  alias                          = each.value.alias
  workspace_id                   = each.value.workspace_id
  evaluation_interval_in_seconds = each.value.evaluation_interval_in_seconds
  labels                         = each.value.labels
  region                         = each.value.region
  tags                           = each.value.tags

  dynamic "configuration" {
    for_each = each.value.configuration != null ? each.value.configuration : []
    content {

      dynamic "random_cut_forest" {
        for_each = configuration.value.random_cut_forest != null ? configuration.value.random_cut_forest : []
        content {
          query        = random_cut_forest.value.query
          sample_size  = random_cut_forest.value.sample_size
          shingle_size = random_cut_forest.value.shingle_size

          dynamic "ignore_near_expected_from_above" {
            for_each = random_cut_forest.value.ignore_near_expected_from_above != null ? random_cut_forest.value.ignore_near_expected_from_above : []
            content {
              amount = ignore_near_expected_from_above.value.amount
              ratio  = ignore_near_expected_from_above.value.ratio
            }
          }

          dynamic "ignore_near_expected_from_below" {
            for_each = random_cut_forest.value.ignore_near_expected_from_below != null ? random_cut_forest.value.ignore_near_expected_from_below : []
            content {
              amount = ignore_near_expected_from_below.value.amount
              ratio  = ignore_near_expected_from_below.value.ratio
            }
          }
        }
      }
    }
  }

  dynamic "missing_data_action" {
    for_each = each.value.missing_data_action != null ? each.value.missing_data_action : []
    content {
      mark_as_anomaly = missing_data_action.value.mark_as_anomaly
      skip            = missing_data_action.value.skip
    }
  }
}
