variable "vpc_ipam_scopes" {
  description = <<EOT
Map of vpc_ipam_scopes, attributes below
Required:
    - ipam_id
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    ipam_id     = string
    description = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
  }))
}
