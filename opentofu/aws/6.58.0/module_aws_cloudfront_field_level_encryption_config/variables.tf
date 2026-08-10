variable "cloudfront_field_level_encryption_configs" {
  description = <<EOT
Map of cloudfront_field_level_encryption_configs, attributes below
Required:
    - content_type_profile_config
    - query_arg_profile_config
Optional:
    - comment
EOT

  type = map(object({
    comment                     = optional(string)
    content_type_profile_config = list(object({
            forward_when_content_type_is_unknown = bool
            content_type_profiles                = list(object({
                items = set(object({
                    content_type = string
                    format       = string
                    profile_id   = optional(string)
                }))
            }))
        }))
    query_arg_profile_config    = list(object({
            forward_when_query_arg_profile_is_unknown = bool
            query_arg_profiles                        = optional(list(object({
                items = optional(set(object({
                    profile_id = string
                    query_arg  = string
                })))
            })))
        }))
  }))
}
