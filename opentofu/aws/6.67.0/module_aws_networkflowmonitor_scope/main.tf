resource "aws_networkflowmonitor_scope" "networkflowmonitor_scopes" {
  for_each = var.networkflowmonitor_scopes

  region = each.value.region
  tags   = each.value.tags

  dynamic "target" {
    for_each = each.value.target != null ? each.value.target : []
    content {
      region = target.value.region

      dynamic "target_identifier" {
        for_each = target.value.target_identifier != null ? target.value.target_identifier : []
        content {
          target_type = target_identifier.value.target_type

          dynamic "target_id" {
            for_each = target_identifier.value.target_id != null ? target_identifier.value.target_id : []
            content {
              account_id = target_id.value.account_id
            }
          }
        }
      }
    }
  }
}
