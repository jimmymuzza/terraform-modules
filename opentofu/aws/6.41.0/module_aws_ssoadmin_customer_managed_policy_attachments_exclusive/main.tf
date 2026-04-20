resource "aws_ssoadmin_customer_managed_policy_attachments_exclusive" "ssoadmin_customer_managed_policy_attachments_exclusives" {
  for_each = var.ssoadmin_customer_managed_policy_attachments_exclusives

  instance_arn       = each.value.instance_arn
  permission_set_arn = each.value.permission_set_arn
  region             = each.value.region

  dynamic "customer_managed_policy_reference" {
    for_each = each.value.customer_managed_policy_reference != null ? each.value.customer_managed_policy_reference : []
    content {
      name = customer_managed_policy_reference.value.name
      path = customer_managed_policy_reference.value.path
    }
  }
}
