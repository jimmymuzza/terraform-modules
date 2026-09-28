variable "s3_bucket_website_configurations" {
  description = <<EOT
Map of s3_bucket_website_configurations, attributes below
Required:
    - bucket
Optional:
    - expected_bucket_owner
    - region
    - routing_rules
    - error_document
    - index_document
    - redirect_all_requests_to
    - routing_rule
EOT

  type = map(object({
    bucket                   = string
    expected_bucket_owner    = optional(string)
    region                   = optional(string)
    routing_rules            = optional(string)
    error_document           = optional(list(object({
            key = string
        })))
    index_document           = optional(list(object({
            suffix = string
        })))
    redirect_all_requests_to = optional(list(object({
            host_name = string
            protocol  = optional(string)
        })))
    routing_rule             = optional(list(object({
            condition = optional(list(object({
                http_error_code_returned_equals = optional(string)
                key_prefix_equals               = optional(string)
            })))
            redirect  = list(object({
                host_name               = optional(string)
                http_redirect_code      = optional(string)
                protocol                = optional(string)
                replace_key_prefix_with = optional(string)
                replace_key_with        = optional(string)
            }))
        })))
  }))
}
