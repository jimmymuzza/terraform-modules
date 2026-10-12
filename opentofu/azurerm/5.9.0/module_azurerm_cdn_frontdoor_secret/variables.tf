variable "cdn_frontdoor_secrets" {
  description = <<EOT
Map of cdn_frontdoor_secrets, attributes below
Required:
    - cdn_frontdoor_profile_id
    - name
    - secret
EOT

  type = map(object({
    cdn_frontdoor_profile_id = string
    name                     = string
    secret                   = list(object({
            customer_certificate = list(object({
                key_vault_certificate_id = string
            }))
        }))
  }))
}
