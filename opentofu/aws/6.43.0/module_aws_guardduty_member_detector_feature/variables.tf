variable "guardduty_member_detector_features" {
  description = <<EOT
Map of guardduty_member_detector_features, attributes below
Required:
    - account_id
    - detector_id
    - name
    - status
Optional:
    - region
    - additional_configuration
EOT

  type = map(object({
    account_id               = string
    detector_id              = string
    name                     = string
    status                   = string
    region                   = optional(string)
    additional_configuration = optional(list(object({
            name   = string
            status = string
        })))
  }))
}
