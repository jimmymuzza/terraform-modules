variable "palo_alto_local_rulestacks" {
  description = <<EOT
Map of palo_alto_local_rulestacks, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - anti_spyware_profile
    - anti_virus_profile
    - description
    - dns_subscription
    - file_blocking_profile
    - url_filtering_profile
    - vulnerability_profile
EOT

  type = map(object({
    location              = string
    name                  = string
    resource_group_name   = string
    anti_spyware_profile  = optional(string)
    anti_virus_profile    = optional(string)
    description           = optional(string)
    dns_subscription      = optional(string)
    file_blocking_profile = optional(string)
    url_filtering_profile = optional(string)
    vulnerability_profile = optional(string)
  }))
}
