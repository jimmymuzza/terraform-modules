resource "aws_msk_scram_secret_association" "msk_scram_secret_associations" {
  for_each = var.msk_scram_secret_associations

  cluster_arn     = each.value.cluster_arn
  secret_arn_list = each.value.secret_arn_list
  region          = each.value.region
}
