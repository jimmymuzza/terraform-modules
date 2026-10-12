variable "lambda_alias" {
  description = <<EOT
Map of lambda_alias, attributes below
Required:
    - function_name
    - function_version
    - name
Optional:
    - description
    - region
    - routing_config
EOT

  type = map(object({
    function_name    = string
    function_version = string
    name             = string
    description      = optional(string)
    region           = optional(string)
    routing_config   = optional(list(object({
            additional_version_weights = optional(map(number))
        })))
  }))
}
