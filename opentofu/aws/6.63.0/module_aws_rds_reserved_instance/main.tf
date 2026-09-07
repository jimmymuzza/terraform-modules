resource "aws_rds_reserved_instance" "rds_reserved_instances" {
  for_each = var.rds_reserved_instances

  offering_id    = each.value.offering_id
  instance_count = each.value.instance_count
  region         = each.value.region
  reservation_id = each.value.reservation_id
  tags           = each.value.tags
  tags_all       = each.value.tags_all
}
