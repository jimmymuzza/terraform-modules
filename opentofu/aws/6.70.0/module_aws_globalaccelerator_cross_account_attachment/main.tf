resource "aws_globalaccelerator_cross_account_attachment" "globalaccelerator_cross_account_attachments" {
  for_each = var.globalaccelerator_cross_account_attachments

  name       = each.value.name
  principals = each.value.principals
  tags       = each.value.tags

  dynamic "resource" {
    for_each = each.value.resource != null ? each.value.resource : []
    content {
      cidr_block  = resource.value.cidr_block
      endpoint_id = resource.value.endpoint_id
      region      = resource.value.region
    }
  }
}
