variable "inspector2_member_associations" {
  description = <<EOT
Map of inspector2_member_associations, attributes below
Required:
    - account_id
Optional:
    - region
EOT

  type = map(object({
    account_id = string
    region     = optional(string)
  }))
}
