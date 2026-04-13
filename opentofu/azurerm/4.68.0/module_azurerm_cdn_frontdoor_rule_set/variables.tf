variable "cdn_frontdoor_rule_sets" {
  description = <<EOT
Map of cdn_frontdoor_rule_sets, attributes below
Required:
    - cdn_frontdoor_profile_id
    - name
EOT

  type = map(object({
    cdn_frontdoor_profile_id = string
    name                     = string
  }))
}
