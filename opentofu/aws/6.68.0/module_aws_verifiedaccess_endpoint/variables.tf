variable "verifiedaccess_endpoints" {
  description = <<EOT
Map of verifiedaccess_endpoints, attributes below
Required:
    - attachment_type
    - endpoint_type
    - verified_access_group_id
Optional:
    - application_domain
    - description
    - domain_certificate_arn
    - endpoint_domain_prefix
    - policy_document
    - region
    - security_group_ids
    - tags
    - tags_all
    - cidr_options
    - load_balancer_options
    - network_interface_options
    - rds_options
    - sse_specification
EOT

  type = map(object({
    attachment_type           = string
    endpoint_type             = string
    verified_access_group_id  = string
    application_domain        = optional(string)
    description               = optional(string)
    domain_certificate_arn    = optional(string)
    endpoint_domain_prefix    = optional(string)
    policy_document           = optional(string)
    region                    = optional(string)
    security_group_ids        = optional(set(string))
    tags                      = optional(map(string))
    tags_all                  = optional(map(string))
    cidr_options              = optional(list(object({
            cidr       = string
            protocol   = optional(string)
            subnet_ids = optional(set(string))
            port_range = set(object({
                from_port = number
                to_port   = number
            }))
        })))
    load_balancer_options     = optional(list(object({
            load_balancer_arn = optional(string)
            port              = optional(number)
            protocol          = optional(string)
            subnet_ids        = optional(set(string))
            port_range        = optional(set(object({
                from_port = number
                to_port   = number
            })))
        })))
    network_interface_options = optional(list(object({
            network_interface_id = optional(string)
            port                 = optional(number)
            protocol             = optional(string)
            port_range           = optional(set(object({
                from_port = number
                to_port   = number
            })))
        })))
    rds_options               = optional(list(object({
            port                = optional(number)
            protocol            = optional(string)
            rds_db_cluster_arn  = optional(string)
            rds_db_instance_arn = optional(string)
            rds_db_proxy_arn    = optional(string)
            rds_endpoint        = optional(string)
            subnet_ids          = optional(set(string))
        })))
    sse_specification         = optional(list(object({
            customer_managed_key_enabled = optional(bool)
            kms_key_arn                  = optional(string)
        })))
  }))
}
