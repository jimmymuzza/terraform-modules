resource "aws_iam_service_linked_role" "iam_service_linked_roles" {
  for_each = var.iam_service_linked_roles

  aws_service_name = each.value.aws_service_name
  custom_suffix    = each.value.custom_suffix
  description      = each.value.description
  tags             = each.value.tags
  tags_all         = each.value.tags_all
}
