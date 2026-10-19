variable "ec2_managed_prefix_lists" {
  description = <<EOT
Map of ec2_managed_prefix_lists, attributes below
Required:
    - address_family
    - max_entries
    - name
Optional:
    - region
    - tags
    - tags_all
    - entry
EOT

  type = map(object({
    address_family = string
    max_entries    = number
    name           = string
    region         = optional(string)
    tags           = optional(map(string))
    tags_all       = optional(map(string))
    entry          = optional(set(object({
            cidr        = string
            description = optional(string)
        })))
  }))
}
