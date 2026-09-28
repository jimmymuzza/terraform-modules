variable "lambda_function_scaling_configs" {
  description = <<EOT
Map of lambda_function_scaling_configs, attributes below
Required:
    - function_name
    - qualifier
Optional:
    - region
    - function_scaling_config
EOT

  type = map(object({
    function_name           = string
    qualifier               = string
    region                  = optional(string)
    function_scaling_config = optional(list(object({
            max_execution_environments = optional(number)
            min_execution_environments = optional(number)
        })))
  }))
}
