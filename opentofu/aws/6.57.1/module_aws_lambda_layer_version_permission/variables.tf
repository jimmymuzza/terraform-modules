variable "lambda_layer_version_permissions" {
  description = <<EOT
Map of lambda_layer_version_permissions, attributes below
Required:
    - action
    - layer_name
    - principal
    - statement_id
    - version_number
Optional:
    - organization_id
    - region
    - skip_destroy
EOT

  type = map(object({
    action          = string
    layer_name      = string
    principal       = string
    statement_id    = string
    version_number  = number
    organization_id = optional(string)
    region          = optional(string)
    skip_destroy    = optional(bool)
  }))
}
