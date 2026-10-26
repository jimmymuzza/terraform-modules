variable "elastictranscoder_pipelines" {
  description = <<EOT
Map of elastictranscoder_pipelines, attributes below
Required:
    - input_bucket
    - role
Optional:
    - aws_kms_key_arn
    - name
    - output_bucket
    - region
    - content_config
    - content_config_permissions
    - notifications
    - thumbnail_config
    - thumbnail_config_permissions
EOT

  type = map(object({
    input_bucket                 = string
    role                         = string
    aws_kms_key_arn              = optional(string)
    name                         = optional(string)
    output_bucket                = optional(string)
    region                       = optional(string)
    content_config               = optional(list(object({
            bucket        = optional(string)
            storage_class = optional(string)
        })))
    content_config_permissions   = optional(set(object({
            access       = optional(list(string))
            grantee      = optional(string)
            grantee_type = optional(string)
        })))
    notifications                = optional(list(object({
            completed   = optional(string)
            error       = optional(string)
            progressing = optional(string)
            warning     = optional(string)
        })))
    thumbnail_config             = optional(list(object({
            bucket        = optional(string)
            storage_class = optional(string)
        })))
    thumbnail_config_permissions = optional(set(object({
            access       = optional(list(string))
            grantee      = optional(string)
            grantee_type = optional(string)
        })))
  }))
}
