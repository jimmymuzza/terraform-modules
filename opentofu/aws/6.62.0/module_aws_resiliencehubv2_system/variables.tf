variable "resiliencehubv2_systems" {
  description = <<EOT
Map of resiliencehubv2_systems, attributes below
Required:
    - name
Optional:
    - description
    - kms_key_id
    - region
    - sharing_enabled
    - tags
EOT

  type = map(object({
    name            = string
    description     = optional(string)
    kms_key_id      = optional(string)
    region          = optional(string)
    sharing_enabled = optional(bool)
    tags            = optional(map(string))
  }))
}
