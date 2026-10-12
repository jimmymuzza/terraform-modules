variable "connect_lambda_function_associations" {
  description = <<EOT
Map of connect_lambda_function_associations, attributes below
Required:
    - function_arn
    - instance_id
Optional:
    - region
EOT

  type = map(object({
    function_arn = string
    instance_id  = string
    region       = optional(string)
  }))
}
