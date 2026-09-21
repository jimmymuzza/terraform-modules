variable "workspacesweb_session_loggers" {
  description = <<EOT
Map of workspacesweb_session_loggers, attributes below
Optional:
    - additional_encryption_context
    - customer_managed_key
    - display_name
    - region
    - tags
    - event_filter
    - log_configuration
EOT

  type = map(object({
    additional_encryption_context = optional(map(string))
    customer_managed_key          = optional(string)
    display_name                  = optional(string)
    region                        = optional(string)
    tags                          = optional(map(string))
    event_filter                  = optional(list(object({
            include = optional(set(string))
            all     = optional(list(object({

            })))
        })))
    log_configuration             = optional(list(object({
            s3 = optional(list(object({
                bucket           = string
                folder_structure = string
                log_file_format  = string
                bucket_owner     = optional(string)
                key_prefix       = optional(string)
            })))
        })))
  }))
}
