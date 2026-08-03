resource "aws_xray_indexing_rule" "xray_indexing_rules" {
  for_each = var.xray_indexing_rules

  name   = each.value.name
  region = each.value.region

  dynamic "rule" {
    for_each = each.value.rule != null ? each.value.rule : []
    content {

      dynamic "probabilistic" {
        for_each = rule.value.probabilistic != null ? rule.value.probabilistic : []
        content {
          desired_sampling_percentage = probabilistic.value.desired_sampling_percentage
        }
      }
    }
  }
}
