resource "aws_msk_topic" "msk_topics" {
  for_each = var.msk_topics

  cluster_arn        = each.value.cluster_arn
  name               = each.value.name
  partition_count    = each.value.partition_count
  replication_factor = each.value.replication_factor
  configs            = each.value.configs
  region             = each.value.region
}
