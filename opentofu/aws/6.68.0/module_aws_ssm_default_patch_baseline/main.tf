resource "aws_ssm_default_patch_baseline" "ssm_default_patch_baselines" {
  for_each = var.ssm_default_patch_baselines

  baseline_id      = each.value.baseline_id
  operating_system = each.value.operating_system
  region           = each.value.region
}
