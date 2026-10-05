variable "lambda_function_recursion_configs" {
  description = <<EOT
Map of lambda_function_recursion_configs, attributes below
Required:
    - function_name
    - recursive_loop
Optional:
    - region
EOT

  type = map(object({
    function_name  = string
    recursive_loop = string
    region         = optional(string)
  }))
}
