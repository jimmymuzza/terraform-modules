variable "lambda_invocations" {
  description = <<EOT
Map of lambda_invocations, attributes below
Required:
    - function_name
    - input
Optional:
    - lifecycle_scope
    - qualifier
    - region
    - tenant_id
    - terraform_key
    - triggers
EOT

  type = map(object({
    function_name   = string
    input           = string
    lifecycle_scope = optional(string)
    qualifier       = optional(string)
    region          = optional(string)
    tenant_id       = optional(string)
    terraform_key   = optional(string)
    triggers        = optional(map(string))
  }))
}
