variable "cleanrooms_memberships" {
  description = <<EOT
Map of cleanrooms_memberships, attributes below
Required:
    - collaboration_id
    - query_log_status
Optional:
    - region
    - tags
    - default_result_configuration
    - payment_configuration
EOT

  type = map(object({
    collaboration_id             = string
    query_log_status             = string
    region                       = optional(string)
    tags                         = optional(map(string))
    default_result_configuration = optional(list(object({
            role_arn             = optional(string)
            output_configuration = optional(list(object({
                s3 = optional(list(object({
                    bucket        = string
                    result_format = string
                    key_prefix    = optional(string)
                })))
            })))
        })))
    payment_configuration        = optional(list(object({
            query_compute = optional(list(object({
                is_responsible = bool
            })))
        })))
  }))
}
