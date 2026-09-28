variable "transfer_web_apps" {
  description = <<EOT
Map of transfer_web_apps, attributes below
Optional:
    - access_endpoint
    - region
    - tags
    - web_app_endpoint_policy
    - web_app_units
    - endpoint_details
    - identity_provider_details
EOT

  type = map(object({
    access_endpoint           = optional(string)
    region                    = optional(string)
    tags                      = optional(map(string))
    web_app_endpoint_policy   = optional(string)
    web_app_units             = optional(list(object({
            provisioned = number
        })))
    endpoint_details          = optional(list(object({
            vpc = optional(list(object({
                subnet_ids         = set(string)
                vpc_id             = string
                security_group_ids = optional(set(string))
            })))
        })))
    identity_provider_details = optional(list(object({
            identity_center_config = optional(list(object({
                instance_arn = optional(string)
                role         = optional(string)
            })))
        })))
  }))
}
