resource "azurerm_storage_account_table_properties" "storage_account_table_properties" {
  for_each = var.storage_account_table_properties

  storage_account_id = each.value.storage_account_id

  dynamic "cors_rule" {
    for_each = each.value.cors_rule != null ? each.value.cors_rule : []
    content {
      allowed_headers    = cors_rule.value.allowed_headers
      allowed_methods    = cors_rule.value.allowed_methods
      allowed_origins    = cors_rule.value.allowed_origins
      exposed_headers    = cors_rule.value.exposed_headers
      max_age_in_seconds = cors_rule.value.max_age_in_seconds
    }
  }

  dynamic "hour_metrics" {
    for_each = each.value.hour_metrics != null ? each.value.hour_metrics : []
    content {
      version               = hour_metrics.value.version
      include_apis          = hour_metrics.value.include_apis
      retention_policy_days = hour_metrics.value.retention_policy_days
    }
  }

  dynamic "logging" {
    for_each = each.value.logging != null ? each.value.logging : []
    content {
      delete                = logging.value.delete
      read                  = logging.value.read
      version               = logging.value.version
      write                 = logging.value.write
      retention_policy_days = logging.value.retention_policy_days
    }
  }

  dynamic "minute_metrics" {
    for_each = each.value.minute_metrics != null ? each.value.minute_metrics : []
    content {
      version               = minute_metrics.value.version
      include_apis          = minute_metrics.value.include_apis
      retention_policy_days = minute_metrics.value.retention_policy_days
    }
  }
}
