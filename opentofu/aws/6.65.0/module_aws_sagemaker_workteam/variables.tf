variable "sagemaker_workteams" {
  description = <<EOT
Map of sagemaker_workteams, attributes below
Required:
    - description
    - workteam_name
    - member_definition
Optional:
    - region
    - tags
    - tags_all
    - workforce_name
    - notification_configuration
    - worker_access_configuration
EOT

  type = map(object({
    description                 = string
    workteam_name               = string
    region                      = optional(string)
    tags                        = optional(map(string))
    tags_all                    = optional(map(string))
    workforce_name              = optional(string)
    member_definition           = list(object({
            cognito_member_definition = optional(list(object({
                client_id  = string
                user_group = string
                user_pool  = string
            })))
            oidc_member_definition    = optional(list(object({
                groups = set(string)
            })))
        }))
    notification_configuration  = optional(list(object({
            notification_topic_arn = optional(string)
        })))
    worker_access_configuration = optional(list(object({
            s3_presign = optional(list(object({
                iam_policy_constraints = optional(list(object({
                    source_ip     = optional(string)
                    vpc_source_ip = optional(string)
                })))
            })))
        })))
  }))
}
