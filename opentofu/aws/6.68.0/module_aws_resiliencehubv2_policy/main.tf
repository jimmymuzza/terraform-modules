resource "aws_resiliencehubv2_policy" "resiliencehubv2_policies" {
  for_each = var.resiliencehubv2_policies

  name        = each.value.name
  description = each.value.description
  kms_key_id  = each.value.kms_key_id
  region      = each.value.region
  tags        = each.value.tags

  dynamic "availability_slo" {
    for_each = each.value.availability_slo != null ? each.value.availability_slo : []
    content {
      target = availability_slo.value.target
    }
  }

  dynamic "data_recovery" {
    for_each = each.value.data_recovery != null ? each.value.data_recovery : []
    content {
      time_between_backups_in_minutes = data_recovery.value.time_between_backups_in_minutes
    }
  }

  dynamic "multi_az" {
    for_each = each.value.multi_az != null ? each.value.multi_az : []
    content {
      disaster_recovery_approach = multi_az.value.disaster_recovery_approach
      rpo_in_minutes             = multi_az.value.rpo_in_minutes
      rto_in_minutes             = multi_az.value.rto_in_minutes
    }
  }

  dynamic "multi_region" {
    for_each = each.value.multi_region != null ? each.value.multi_region : []
    content {
      disaster_recovery_approach = multi_region.value.disaster_recovery_approach
      rpo_in_minutes             = multi_region.value.rpo_in_minutes
      rto_in_minutes             = multi_region.value.rto_in_minutes
    }
  }
}
