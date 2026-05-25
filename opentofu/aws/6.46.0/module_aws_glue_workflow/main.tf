resource "aws_glue_workflow" "glue_workflows" {
  for_each = var.glue_workflows

  default_run_properties = each.value.default_run_properties
  description            = each.value.description
  max_concurrent_runs    = each.value.max_concurrent_runs
  name                   = each.value.name
  region                 = each.value.region
  tags                   = each.value.tags
  tags_all               = each.value.tags_all
}
