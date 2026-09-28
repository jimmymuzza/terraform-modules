resource "aws_devopsguru_service_integration" "devopsguru_service_integrations" {
  for_each = var.devopsguru_service_integrations

  region = each.value.region

  dynamic "kms_server_side_encryption" {
    for_each = each.value.kms_server_side_encryption != null ? each.value.kms_server_side_encryption : []
    content {
      kms_key_id    = kms_server_side_encryption.value.kms_key_id
      opt_in_status = kms_server_side_encryption.value.opt_in_status
      type          = kms_server_side_encryption.value.type
    }
  }

  dynamic "logs_anomaly_detection" {
    for_each = each.value.logs_anomaly_detection != null ? each.value.logs_anomaly_detection : []
    content {
      opt_in_status = logs_anomaly_detection.value.opt_in_status
    }
  }

  dynamic "ops_center" {
    for_each = each.value.ops_center != null ? each.value.ops_center : []
    content {
      opt_in_status = ops_center.value.opt_in_status
    }
  }
}
