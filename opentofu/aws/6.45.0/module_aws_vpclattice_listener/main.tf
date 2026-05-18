resource "aws_vpclattice_listener" "vpclattice_listeners" {
  for_each = var.vpclattice_listeners

  name               = each.value.name
  protocol           = each.value.protocol
  port               = each.value.port
  region             = each.value.region
  service_arn        = each.value.service_arn
  service_identifier = each.value.service_identifier
  tags               = each.value.tags
  tags_all           = each.value.tags_all

  dynamic "default_action" {
    for_each = each.value.default_action != null ? each.value.default_action : []
    content {

      dynamic "fixed_response" {
        for_each = default_action.value.fixed_response != null ? default_action.value.fixed_response : []
        content {
          status_code = fixed_response.value.status_code
        }
      }

      dynamic "forward" {
        for_each = default_action.value.forward != null ? default_action.value.forward : []
        content {

          dynamic "target_groups" {
            for_each = forward.value.target_groups != null ? forward.value.target_groups : []
            content {
              target_group_identifier = target_groups.value.target_group_identifier
              weight                  = target_groups.value.weight
            }
          }
        }
      }
    }
  }
}
