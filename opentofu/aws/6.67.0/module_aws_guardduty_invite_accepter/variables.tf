variable "guardduty_invite_accepters" {
  description = <<EOT
Map of guardduty_invite_accepters, attributes below
Required:
    - detector_id
    - master_account_id
Optional:
    - region
EOT

  type = map(object({
    detector_id       = string
    master_account_id = string
    region            = optional(string)
  }))
}
