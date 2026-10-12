resource "aws_fis_safety_lever_state" "fis_safety_lever_states" {
  for_each = var.fis_safety_lever_states

  region = each.value.region

  dynamic "state" {
    for_each = each.value.state != null ? each.value.state : []
    content {
      reason = state.value.reason
      status = state.value.status
    }
  }
}
