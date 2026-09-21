resource "aws_ce_cost_allocation_tag" "ce_cost_allocation_tags" {
  for_each = var.ce_cost_allocation_tags

  status  = each.value.status
  tag_key = each.value.tag_key
}
