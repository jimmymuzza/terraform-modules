variable "guardduty_publishing_destinations" {
  description = <<EOT
Map of guardduty_publishing_destinations, attributes below
Required:
    - destination_arn
    - detector_id
    - kms_key_arn
Optional:
    - destination_type
    - region
EOT

  type = map(object({
    destination_arn  = string
    detector_id      = string
    kms_key_arn      = string
    destination_type = optional(string)
    region           = optional(string)
  }))
}
