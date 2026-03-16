resource "aws_serverlessapplicationrepository_cloudformation_stack" "serverlessapplicationrepository_cloudformation_stacks" {
  for_each = var.serverlessapplicationrepository_cloudformation_stacks

  application_id   = each.value.application_id
  capabilities     = each.value.capabilities
  name             = each.value.name
  parameters       = each.value.parameters
  region           = each.value.region
  semantic_version = each.value.semantic_version
  tags             = each.value.tags
  tags_all         = each.value.tags_all
}
