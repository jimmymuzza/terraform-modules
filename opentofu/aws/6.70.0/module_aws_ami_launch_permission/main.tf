resource "aws_ami_launch_permission" "ami_launch_permissions" {
  for_each = var.ami_launch_permissions

  image_id                = each.value.image_id
  account_id              = each.value.account_id
  group                   = each.value.group
  organization_arn        = each.value.organization_arn
  organizational_unit_arn = each.value.organizational_unit_arn
  region                  = each.value.region
}
