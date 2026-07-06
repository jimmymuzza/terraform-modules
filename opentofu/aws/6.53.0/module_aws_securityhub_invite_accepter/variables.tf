variable "securityhub_invite_accepters" {
  description = <<EOT
Map of securityhub_invite_accepters, attributes below
Required:
    - master_id
Optional:
    - region
EOT

  type = map(object({
    master_id = string
    region    = optional(string)
  }))
}
