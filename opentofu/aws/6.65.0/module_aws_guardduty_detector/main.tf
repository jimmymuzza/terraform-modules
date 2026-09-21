resource "aws_guardduty_detector" "guardduty_detectors" {
  for_each = var.guardduty_detectors

  enable                       = each.value.enable
  finding_publishing_frequency = each.value.finding_publishing_frequency
  region                       = each.value.region
  tags                         = each.value.tags
  tags_all                     = each.value.tags_all

  dynamic "datasources" {
    for_each = each.value.datasources != null ? each.value.datasources : []
    content {

      dynamic "kubernetes" {
        for_each = datasources.value.kubernetes != null ? datasources.value.kubernetes : []
        content {

          dynamic "audit_logs" {
            for_each = kubernetes.value.audit_logs != null ? kubernetes.value.audit_logs : []
            content {
              enable = audit_logs.value.enable
            }
          }
        }
      }

      dynamic "malware_protection" {
        for_each = datasources.value.malware_protection != null ? datasources.value.malware_protection : []
        content {

          dynamic "scan_ec2_instance_with_findings" {
            for_each = malware_protection.value.scan_ec2_instance_with_findings != null ? malware_protection.value.scan_ec2_instance_with_findings : []
            content {

              dynamic "ebs_volumes" {
                for_each = scan_ec2_instance_with_findings.value.ebs_volumes != null ? scan_ec2_instance_with_findings.value.ebs_volumes : []
                content {
                  enable = ebs_volumes.value.enable
                }
              }
            }
          }
        }
      }

      dynamic "s3_logs" {
        for_each = datasources.value.s3_logs != null ? datasources.value.s3_logs : []
        content {
          enable = s3_logs.value.enable
        }
      }
    }
  }
}
