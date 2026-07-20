variable "iot_authorizers" {
  description = <<EOT
Map of iot_authorizers, attributes below
Required:
    - authorizer_function_arn
    - name
Optional:
    - enable_caching_for_http
    - region
    - signing_disabled
    - status
    - tags
    - tags_all
    - token_key_name
    - token_signing_public_keys
EOT

  type = map(object({
    authorizer_function_arn   = string
    name                      = string
    enable_caching_for_http   = optional(bool)
    region                    = optional(string)
    signing_disabled          = optional(bool)
    status                    = optional(string)
    tags                      = optional(map(string))
    tags_all                  = optional(map(string))
    token_key_name            = optional(string)
    token_signing_public_keys = optional(map(string))
  }))
}
