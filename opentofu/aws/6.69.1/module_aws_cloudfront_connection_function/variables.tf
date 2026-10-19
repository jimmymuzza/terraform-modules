variable "cloudfront_connection_functions" {
  description = <<EOT
Map of cloudfront_connection_functions, attributes below
Required:
    - connection_function_code
    - name
Optional:
    - publish
    - tags
    - connection_function_config
EOT

  type = map(object({
    connection_function_code   = string
    name                       = string
    publish                    = optional(bool)
    tags                       = optional(map(string))
    connection_function_config = optional(list(object({
            comment                     = string
            runtime                     = string
            key_value_store_association = optional(list(object({
                key_value_store_arn = string
            })))
        })))
  }))
}
