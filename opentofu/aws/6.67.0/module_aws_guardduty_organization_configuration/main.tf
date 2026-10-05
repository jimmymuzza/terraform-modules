resource "aws_guardduty_organization_configuration" "guardduty_organization_configurations" {
  for_each = var.guardduty_organization_configurations

  auto_enable_organization_members = each.value.auto_enable_organization_members
  detector_id                      = each.value.detector_id
  region                           = each.value.region

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
                  auto_enable = ebs_volumes.value.auto_enable
                }
              }
            }
          }
        }
      }

      dynamic "s3_logs" {
        for_each = datasources.value.s3_logs != null ? datasources.value.s3_logs : []
        content {
          auto_enable = s3_logs.value.auto_enable
        }
      }
    }
  }
}
