variable "macie2_accounts" {
  description = <<EOT
Map of macie2_accounts, attributes below
Optional:
    - finding_publishing_frequency
    - region
    - status
EOT

  type = map(object({
    finding_publishing_frequency = optional(string)
    region                       = optional(string)
    status                       = optional(string)
  }))
}
