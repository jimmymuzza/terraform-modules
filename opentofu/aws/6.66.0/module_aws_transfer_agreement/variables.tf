variable "transfer_agreements" {
  description = <<EOT
Map of transfer_agreements, attributes below
Required:
    - access_role
    - base_directory
    - local_profile_id
    - partner_profile_id
    - server_id
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    access_role        = string
    base_directory     = string
    local_profile_id   = string
    partner_profile_id = string
    server_id          = string
    description        = optional(string)
    region             = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
  }))
}
