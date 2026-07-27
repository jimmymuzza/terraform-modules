resource "aws_cloudhsm_v2_hsm" "cloudhsm_v2_hsms" {
  for_each = var.cloudhsm_v2_hsms

  cluster_id        = each.value.cluster_id
  availability_zone = each.value.availability_zone
  ip_address        = each.value.ip_address
  region            = each.value.region
  subnet_id         = each.value.subnet_id
}
