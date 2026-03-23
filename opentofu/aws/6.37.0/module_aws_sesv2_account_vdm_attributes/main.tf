resource "aws_sesv2_account_vdm_attributes" "sesv2_account_vdm_attributes" {
  for_each = var.sesv2_account_vdm_attributes

  vdm_enabled = each.value.vdm_enabled
  region      = each.value.region

  dynamic "dashboard_attributes" {
    for_each = each.value.dashboard_attributes != null ? each.value.dashboard_attributes : []
    content {
      engagement_metrics = dashboard_attributes.value.engagement_metrics
    }
  }

  dynamic "guardian_attributes" {
    for_each = each.value.guardian_attributes != null ? each.value.guardian_attributes : []
    content {
      optimized_shared_delivery = guardian_attributes.value.optimized_shared_delivery
    }
  }
}
