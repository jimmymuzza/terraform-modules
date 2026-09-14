resource "aws_ssm_patch_group" "ssm_patch_groups" {
  for_each = var.ssm_patch_groups

  baseline_id = each.value.baseline_id
  patch_group = each.value.patch_group
  region      = each.value.region
}
