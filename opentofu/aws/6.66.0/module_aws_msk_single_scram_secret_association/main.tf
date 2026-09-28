resource "aws_msk_single_scram_secret_association" "msk_single_scram_secret_associations" {
  for_each = var.msk_single_scram_secret_associations

  cluster_arn = each.value.cluster_arn
  secret_arn  = each.value.secret_arn
  region      = each.value.region
}
