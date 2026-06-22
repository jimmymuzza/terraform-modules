resource "aws_codeguruprofiler_profiling_group" "codeguruprofiler_profiling_groups" {
  for_each = var.codeguruprofiler_profiling_groups

  name             = each.value.name
  compute_platform = each.value.compute_platform
  region           = each.value.region
  tags             = each.value.tags

  dynamic "agent_orchestration_config" {
    for_each = each.value.agent_orchestration_config != null ? each.value.agent_orchestration_config : []
    content {
      profiling_enabled = agent_orchestration_config.value.profiling_enabled
    }
  }
}
