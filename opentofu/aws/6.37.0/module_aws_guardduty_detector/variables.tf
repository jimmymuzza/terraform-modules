variable "guardduty_detectors" {
  description = <<EOT
Map of guardduty_detectors, attributes below
Optional:
    - enable
    - finding_publishing_frequency
    - region
    - tags
    - tags_all
    - datasources
EOT

  type = map(object({
    enable                       = optional(bool)
    finding_publishing_frequency = optional(string)
    region                       = optional(string)
    tags                         = optional(map(string))
    tags_all                     = optional(map(string))
    datasources                  = optional(list(object({
            kubernetes         = optional(list(object({
                audit_logs = list(object({
                    enable = bool
                }))
            })))
            malware_protection = optional(list(object({
                scan_ec2_instance_with_findings = list(object({
                    ebs_volumes = list(object({
                        enable = bool
                    }))
                }))
            })))
            s3_logs            = optional(list(object({
                enable = bool
            })))
        })))
  }))
}
