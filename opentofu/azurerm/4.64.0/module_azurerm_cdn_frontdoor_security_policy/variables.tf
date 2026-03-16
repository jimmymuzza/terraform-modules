variable "cdn_frontdoor_security_policies" {
  description = <<EOT
Map of cdn_frontdoor_security_policies, attributes below
Required:
    - cdn_frontdoor_profile_id
    - name
    - security_policies
EOT

  type = map(object({
    cdn_frontdoor_profile_id = string
    name                     = string
    security_policies        = list(object({
            firewall = list(object({
                cdn_frontdoor_firewall_policy_id = string
                association                      = list(object({
                    patterns_to_match = list(string)
                    domain            = list(object({
                        cdn_frontdoor_domain_id = string
                    }))
                }))
            }))
        }))
  }))
}
