resource "aws_cloudwatch_log_anomaly_detector" "cloudwatch_log_anomaly_detectors" {
  for_each = var.cloudwatch_log_anomaly_detectors

  enabled                 = each.value.enabled
  log_group_arn_list      = each.value.log_group_arn_list
  anomaly_visibility_time = each.value.anomaly_visibility_time
  detector_name           = each.value.detector_name
  evaluation_frequency    = each.value.evaluation_frequency
  filter_pattern          = each.value.filter_pattern
  kms_key_id              = each.value.kms_key_id
  region                  = each.value.region
  tags                    = each.value.tags
}
