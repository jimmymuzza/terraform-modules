resource "aws_observabilityadmin_centralization_rule_for_organization" "observabilityadmin_centralization_rule_for_organizations" {
  for_each = var.observabilityadmin_centralization_rule_for_organizations

  rule_name = each.value.rule_name
  region    = each.value.region
  tags      = each.value.tags

  dynamic "rule" {
    for_each = each.value.rule != null ? each.value.rule : []
    content {

      dynamic "destination" {
        for_each = rule.value.destination != null ? rule.value.destination : []
        content {
          account = destination.value.account
          region  = destination.value.region

          dynamic "destination_logs_configuration" {
            for_each = destination.value.destination_logs_configuration != null ? destination.value.destination_logs_configuration : []
            content {

              dynamic "backup_configuration" {
                for_each = destination_logs_configuration.value.backup_configuration != null ? destination_logs_configuration.value.backup_configuration : []
                content {
                  kms_key_arn = backup_configuration.value.kms_key_arn
                  region      = backup_configuration.value.region
                }
              }

              dynamic "logs_encryption_configuration" {
                for_each = destination_logs_configuration.value.logs_encryption_configuration != null ? destination_logs_configuration.value.logs_encryption_configuration : []
                content {
                  encryption_strategy                     = logs_encryption_configuration.value.encryption_strategy
                  encryption_conflict_resolution_strategy = logs_encryption_configuration.value.encryption_conflict_resolution_strategy
                  kms_key_arn                             = logs_encryption_configuration.value.kms_key_arn
                }
              }
            }
          }
        }
      }

      dynamic "source" {
        for_each = rule.value.source != null ? rule.value.source : []
        content {
          regions = source.value.regions
          scope   = source.value.scope

          dynamic "source_logs_configuration" {
            for_each = source.value.source_logs_configuration != null ? source.value.source_logs_configuration : []
            content {
              encrypted_log_group_strategy = source_logs_configuration.value.encrypted_log_group_strategy
              log_group_selection_criteria = source_logs_configuration.value.log_group_selection_criteria
            }
          }
        }
      }
    }
  }
}
