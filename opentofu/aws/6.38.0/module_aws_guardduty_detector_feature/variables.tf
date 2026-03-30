variable "guardduty_detector_features" {
  description = <<EOT
Map of guardduty_detector_features, attributes below
Required:
    - detector_id
    - name
    - status
Optional:
    - region
    - additional_configuration
EOT

  type = map(object({
    detector_id              = string
    name                     = string
    status                   = string
    region                   = optional(string)
    additional_configuration = optional(set(object({
            name   = string
            status = string
        })))
  }))
}
