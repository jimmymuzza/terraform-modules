resource "aws_lightsail_instance" "lightsail_instances" {
  for_each = var.lightsail_instances

  availability_zone = each.value.availability_zone
  blueprint_id      = each.value.blueprint_id
  bundle_id         = each.value.bundle_id
  name              = each.value.name
  ip_address_type   = each.value.ip_address_type
  key_pair_name     = each.value.key_pair_name
  region            = each.value.region
  tags              = each.value.tags
  tags_all          = each.value.tags_all
  user_data         = each.value.user_data

  dynamic "add_on" {
    for_each = each.value.add_on != null ? each.value.add_on : []
    content {
      snapshot_time = add_on.value.snapshot_time
      status        = add_on.value.status
      type          = add_on.value.type
    }
  }
}
