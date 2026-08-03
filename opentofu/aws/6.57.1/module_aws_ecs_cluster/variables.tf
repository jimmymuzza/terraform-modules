variable "ecs_clusters" {
  description = <<EOT
Map of ecs_clusters, attributes below
Required:
    - name
Optional:
    - region
    - tags
    - tags_all
    - configuration
    - service_connect_defaults
    - setting
EOT

  type = map(object({
    name                     = string
    region                   = optional(string)
    tags                     = optional(map(string))
    tags_all                 = optional(map(string))
    configuration            = optional(list(object({
            execute_command_configuration = optional(list(object({
                kms_key_id        = optional(string)
                logging           = optional(string)
                log_configuration = optional(list(object({
                    cloud_watch_encryption_enabled = optional(bool)
                    cloud_watch_log_group_name     = optional(string)
                    s3_bucket_encryption_enabled   = optional(bool)
                    s3_bucket_name                 = optional(string)
                    s3_key_prefix                  = optional(string)
                })))
            })))
            managed_storage_configuration = optional(list(object({
                fargate_ephemeral_storage_kms_key_id = optional(string)
                kms_key_id                           = optional(string)
            })))
        })))
    service_connect_defaults = optional(list(object({
            namespace = string
        })))
    setting                  = optional(set(object({
            name  = string
            value = string
        })))
  }))
}
