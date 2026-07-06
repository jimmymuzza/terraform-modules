resource "aws_qldb_ledger" "qldb_ledgers" {
  for_each = var.qldb_ledgers

  permissions_mode    = each.value.permissions_mode
  deletion_protection = each.value.deletion_protection
  kms_key             = each.value.kms_key
  name                = each.value.name
  region              = each.value.region
  tags                = each.value.tags
  tags_all            = each.value.tags_all
}
