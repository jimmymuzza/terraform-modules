variable "mailmanager_ingress_points" {
  description = <<EOT
Map of mailmanager_ingress_points, attributes below
Required:
    - name
    - rule_set_id
    - traffic_policy_id
    - type
Optional:
    - region
    - tags
    - tls_policy
    - ingress_point_configuration
    - network_configuration
EOT

  type = map(object({
    name                        = string
    rule_set_id                 = string
    traffic_policy_id           = string
    type                        = string
    region                      = optional(string)
    tags                        = optional(map(string))
    tls_policy                  = optional(string)
    ingress_point_configuration = optional(list(object({
            secret_arn               = optional(string)
            smtp_password_wo         = optional(string)
            smtp_password_wo_version = optional(number)
            tls_auth_configuration   = optional(list(object({
                trust_store = optional(list(object({
                    ca_content  = string
                    crl_content = optional(string)
                    kms_key_arn = optional(string)
                })))
            })))
        })))
    network_configuration       = optional(list(object({
            private_network_configuration = optional(list(object({
                vpc_endpoint_id = string
            })))
            public_network_configuration  = optional(list(object({
                ip_type = string
            })))
        })))
  }))
}
