variable "transfer_profiles" {
  description = <<EOT
Map of transfer_profiles, attributes below
Required:
    - as2_id
    - profile_type
Optional:
    - certificate_ids
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    as2_id          = string
    profile_type    = string
    certificate_ids = optional(set(string))
    region          = optional(string)
    tags            = optional(map(string))
    tags_all        = optional(map(string))
  }))
}
