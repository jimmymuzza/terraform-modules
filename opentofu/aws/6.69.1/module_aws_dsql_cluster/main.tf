resource "aws_dsql_cluster" "dsql_clusters" {
  for_each = var.dsql_clusters

  deletion_protection_enabled = each.value.deletion_protection_enabled
  force_destroy               = each.value.force_destroy
  kms_encryption_key          = each.value.kms_encryption_key
  region                      = each.value.region
  tags                        = each.value.tags

  dynamic "multi_region_properties" {
    for_each = each.value.multi_region_properties != null ? each.value.multi_region_properties : []
    content {
      clusters       = multi_region_properties.value.clusters
      witness_region = multi_region_properties.value.witness_region
    }
  }
}
