resource "aws_resiliencehubv2_input_source" "resiliencehubv2_input_sources" {
  for_each = var.resiliencehubv2_input_sources

  service_arn = each.value.service_arn
  region      = each.value.region

  dynamic "resource_configuration" {
    for_each = each.value.resource_configuration != null ? each.value.resource_configuration : []
    content {
      cfn_stack_arn      = resource_configuration.value.cfn_stack_arn
      design_file_s3_url = resource_configuration.value.design_file_s3_url
      tf_state_file_url  = resource_configuration.value.tf_state_file_url

      dynamic "eks" {
        for_each = resource_configuration.value.eks != null ? resource_configuration.value.eks : []
        content {
          cluster_arn = eks.value.cluster_arn
          namespaces  = eks.value.namespaces

          dynamic "label_selector" {
            for_each = eks.value.label_selector != null ? eks.value.label_selector : []
            content {
              match_labels = label_selector.value.match_labels

              dynamic "match_expressions" {
                for_each = label_selector.value.match_expressions != null ? label_selector.value.match_expressions : []
                content {
                  key      = match_expressions.value.key
                  operator = match_expressions.value.operator
                  values   = match_expressions.value.values
                }
              }
            }
          }
        }
      }

      dynamic "resource_tag" {
        for_each = resource_configuration.value.resource_tag != null ? resource_configuration.value.resource_tag : []
        content {
          key    = resource_tag.value.key
          values = resource_tag.value.values
        }
      }
    }
  }
}
