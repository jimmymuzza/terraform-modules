variable "lambda_provisioned_concurrency_configs" {
  description = <<EOT
Map of lambda_provisioned_concurrency_configs, attributes below
Required:
    - function_name
    - provisioned_concurrent_executions
    - qualifier
Optional:
    - region
    - skip_destroy
EOT

  type = map(object({
    function_name                     = string
    provisioned_concurrent_executions = number
    qualifier                         = string
    region                            = optional(string)
    skip_destroy                      = optional(bool)
  }))
}
