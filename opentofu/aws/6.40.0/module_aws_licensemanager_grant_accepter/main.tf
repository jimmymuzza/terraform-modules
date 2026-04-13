resource "aws_licensemanager_grant_accepter" "licensemanager_grant_accepters" {
  for_each = var.licensemanager_grant_accepters

  grant_arn = each.value.grant_arn
  region    = each.value.region
}
