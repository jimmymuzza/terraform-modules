variable "medialive_input_security_groups" {
  description = <<EOT
Map of medialive_input_security_groups, attributes below
Required:
    - whitelist_rules
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    region          = optional(string)
    tags            = optional(map(string))
    tags_all        = optional(map(string))
    whitelist_rules = set(object({
            cidr = string
        }))
  }))
}
