variable "api_gateway_usage_plan_keys" {
  description = <<EOT
Map of api_gateway_usage_plan_keys, attributes below
Required:
    - key_id
    - key_type
    - usage_plan_id
Optional:
    - region
EOT

  type = map(object({
    key_id        = string
    key_type      = string
    usage_plan_id = string
    region        = optional(string)
  }))
}
