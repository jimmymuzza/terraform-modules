resource "aws_memorydb_acl" "memorydb_acls" {
  for_each = var.memorydb_acls

  name        = each.value.name
  name_prefix = each.value.name_prefix
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all
  user_names  = each.value.user_names
}
