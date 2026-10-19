variable "lambda_runtime_management_configs" {
  description = <<EOT
Map of lambda_runtime_management_configs, attributes below
Required:
    - function_name
Optional:
    - qualifier
    - region
    - runtime_version_arn
    - update_runtime_on
EOT

  type = map(object({
    function_name       = string
    qualifier           = optional(string)
    region              = optional(string)
    runtime_version_arn = optional(string)
    update_runtime_on   = optional(string)
  }))
}
