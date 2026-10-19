resource "aws_accessanalyzer_analyzer" "accessanalyzer_analyzers" {
  for_each = var.accessanalyzer_analyzers

  analyzer_name = each.value.analyzer_name
  region        = each.value.region
  tags          = each.value.tags
  tags_all      = each.value.tags_all
  type          = each.value.type

  dynamic "configuration" {
    for_each = each.value.configuration != null ? each.value.configuration : []
    content {

      dynamic "internal_access" {
        for_each = configuration.value.internal_access != null ? configuration.value.internal_access : []
        content {

          dynamic "analysis_rule" {
            for_each = internal_access.value.analysis_rule != null ? internal_access.value.analysis_rule : []
            content {

              dynamic "inclusion" {
                for_each = analysis_rule.value.inclusion != null ? analysis_rule.value.inclusion : []
                content {
                  account_ids    = inclusion.value.account_ids
                  resource_arns  = inclusion.value.resource_arns
                  resource_types = inclusion.value.resource_types
                }
              }
            }
          }
        }
      }

      dynamic "unused_access" {
        for_each = configuration.value.unused_access != null ? configuration.value.unused_access : []
        content {
          unused_access_age = unused_access.value.unused_access_age

          dynamic "analysis_rule" {
            for_each = unused_access.value.analysis_rule != null ? unused_access.value.analysis_rule : []
            content {

              dynamic "exclusion" {
                for_each = analysis_rule.value.exclusion != null ? analysis_rule.value.exclusion : []
                content {
                  account_ids   = exclusion.value.account_ids
                  resource_tags = exclusion.value.resource_tags
                }
              }
            }
          }
        }
      }
    }
  }
}
