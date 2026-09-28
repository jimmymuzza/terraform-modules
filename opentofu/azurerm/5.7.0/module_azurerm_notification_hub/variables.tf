variable "notification_hubs" {
  description = <<EOT
Map of notification_hubs, attributes below
Required:
    - location
    - name
    - namespace_name
    - resource_group_name
Optional:
    - tags
    - apns_credential
    - browser_credential
    - gcm_credential
EOT

  type = map(object({
    location            = string
    name                = string
    namespace_name      = string
    resource_group_name = string
    tags                = optional(map(string))
    apns_credential     = optional(list(object({
            application_mode = string
            bundle_id        = string
            key_id           = string
            team_id          = string
            token            = string
        })))
    browser_credential  = optional(list(object({
            subject           = string
            vapid_private_key = string
            vapid_public_key  = string
        })))
    gcm_credential      = optional(list(object({
            api_key = string
        })))
  }))
}
