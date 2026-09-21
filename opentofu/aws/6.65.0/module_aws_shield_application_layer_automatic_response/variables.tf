variable "shield_application_layer_automatic_responses" {
  description = <<EOT
Map of shield_application_layer_automatic_responses, attributes below
Required:
    - action
    - resource_arn
EOT

  type = map(object({
    action       = string
    resource_arn = string
  }))
}
