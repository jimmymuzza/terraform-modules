resource "aws_ssm_patch_baseline" "ssm_patch_baselines" {
  for_each = var.ssm_patch_baselines

  name                                         = each.value.name
  approved_patches                             = each.value.approved_patches
  approved_patches_compliance_level            = each.value.approved_patches_compliance_level
  approved_patches_enable_non_security         = each.value.approved_patches_enable_non_security
  available_security_updates_compliance_status = each.value.available_security_updates_compliance_status
  description                                  = each.value.description
  operating_system                             = each.value.operating_system
  region                                       = each.value.region
  rejected_patches                             = each.value.rejected_patches
  rejected_patches_action                      = each.value.rejected_patches_action
  tags                                         = each.value.tags
  tags_all                                     = each.value.tags_all

  dynamic "approval_rule" {
    for_each = each.value.approval_rule != null ? each.value.approval_rule : []
    content {
      approve_after_days  = approval_rule.value.approve_after_days
      approve_until_date  = approval_rule.value.approve_until_date
      compliance_level    = approval_rule.value.compliance_level
      enable_non_security = approval_rule.value.enable_non_security

      dynamic "patch_filter" {
        for_each = approval_rule.value.patch_filter != null ? approval_rule.value.patch_filter : []
        content {
          key    = patch_filter.value.key
          values = patch_filter.value.values
        }
      }
    }
  }

  dynamic "global_filter" {
    for_each = each.value.global_filter != null ? each.value.global_filter : []
    content {
      key    = global_filter.value.key
      values = global_filter.value.values
    }
  }

  dynamic "source" {
    for_each = each.value.source != null ? each.value.source : []
    content {
      configuration = source.value.configuration
      name          = source.value.name
      products      = source.value.products
    }
  }
}
