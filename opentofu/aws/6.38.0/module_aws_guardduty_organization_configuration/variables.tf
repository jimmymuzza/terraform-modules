variable "guardduty_organization_configurations" {
  description = <<EOT
Map of guardduty_organization_configurations, attributes below
Required:
    - auto_enable_organization_members
    - detector_id
Optional:
    - region
    - datasources
EOT

  type = map(object({
    auto_enable_organization_members = string
    detector_id                      = string
    region                           = optional(string)
    datasources                      = optional(list(object({
            kubernetes         = optional(list(object({
                audit_logs = list(object({
                    enable = bool
                }))
            })))
            malware_protection = optional(list(object({
                scan_ec2_instance_with_findings = list(object({
                    ebs_volumes = list(object({
                        auto_enable = bool
                    }))
                }))
            })))
            s3_logs            = optional(list(object({
                auto_enable = bool
            })))
        })))
  }))
}
