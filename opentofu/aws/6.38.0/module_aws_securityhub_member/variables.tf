variable "securityhub_members" {
  description = <<EOT
Map of securityhub_members, attributes below
Required:
    - account_id
Optional:
    - email
    - invite
    - region
EOT

  type = map(object({
    account_id = string
    email      = optional(string)
    invite     = optional(bool)
    region     = optional(string)
  }))
}
