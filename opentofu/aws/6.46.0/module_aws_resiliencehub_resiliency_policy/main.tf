resource "aws_resiliencehub_resiliency_policy" "resiliencehub_resiliency_policies" {
  for_each = var.resiliencehub_resiliency_policies

  name                     = each.value.name
  tier                     = each.value.tier
  data_location_constraint = each.value.data_location_constraint
  description              = each.value.description
  region                   = each.value.region
  tags                     = each.value.tags

  dynamic "policy" {
    for_each = each.value.policy != null ? each.value.policy : []
    content {

      dynamic "az" {
        for_each = policy.value.az != null ? policy.value.az : []
        content {
          rpo = az.value.rpo
          rto = az.value.rto
        }
      }

      dynamic "hardware" {
        for_each = policy.value.hardware != null ? policy.value.hardware : []
        content {
          rpo = hardware.value.rpo
          rto = hardware.value.rto
        }
      }

      dynamic "region" {
        for_each = policy.value.region != null ? policy.value.region : []
        content {
          rpo = region.value.rpo
          rto = region.value.rto
        }
      }

      dynamic "software" {
        for_each = policy.value.software != null ? policy.value.software : []
        content {
          rpo = software.value.rpo
          rto = software.value.rto
        }
      }
    }
  }
}
