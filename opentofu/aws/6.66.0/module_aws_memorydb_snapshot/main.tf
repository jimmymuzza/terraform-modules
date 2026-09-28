resource "aws_memorydb_snapshot" "memorydb_snapshots" {
  for_each = var.memorydb_snapshots

  cluster_name = each.value.cluster_name
  kms_key_arn  = each.value.kms_key_arn
  name         = each.value.name
  name_prefix  = each.value.name_prefix
  region       = each.value.region
  tags         = each.value.tags
  tags_all     = each.value.tags_all
}
