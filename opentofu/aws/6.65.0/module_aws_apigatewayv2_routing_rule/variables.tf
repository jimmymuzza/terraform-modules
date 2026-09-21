variable "apigatewayv2_routing_rules" {
  description = <<EOT
Map of apigatewayv2_routing_rules, attributes below
Required:
    - domain_name
    - priority
Optional:
    - region
    - action
    - condition
EOT

  type = map(object({
    domain_name = string
    priority    = number
    region      = optional(string)
    action      = optional(list(object({
            invoke_api = optional(list(object({
                api_id          = string
                stage           = string
                strip_base_path = optional(bool)
            })))
        })))
    condition   = optional(list(object({
            match_base_paths = optional(list(object({
                any_of = set(string)
            })))
            match_headers    = optional(list(object({
                any_of = optional(list(object({
                    header     = string
                    value_glob = string
                })))
            })))
        })))
  }))
}
