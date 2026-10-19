variable "transfer_workflows" {
  description = <<EOT
Map of transfer_workflows, attributes below
Required:
    - steps
Optional:
    - description
    - region
    - tags
    - tags_all
    - on_exception_steps
EOT

  type = map(object({
    description        = optional(string)
    region             = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
    on_exception_steps = optional(list(object({
            type                 = string
            copy_step_details    = optional(list(object({
                name                      = optional(string)
                overwrite_existing        = optional(string)
                source_file_location      = optional(string)
                destination_file_location = optional(list(object({
                    efs_file_location = optional(list(object({
                        file_system_id = optional(string)
                        path           = optional(string)
                    })))
                    s3_file_location  = optional(list(object({
                        bucket = optional(string)
                        key    = optional(string)
                    })))
                })))
            })))
            custom_step_details  = optional(list(object({
                name                 = optional(string)
                source_file_location = optional(string)
                target               = optional(string)
                timeout_seconds      = optional(number)
            })))
            decrypt_step_details = optional(list(object({
                type                      = string
                name                      = optional(string)
                overwrite_existing        = optional(string)
                source_file_location      = optional(string)
                destination_file_location = optional(list(object({
                    efs_file_location = optional(list(object({
                        file_system_id = optional(string)
                        path           = optional(string)
                    })))
                    s3_file_location  = optional(list(object({
                        bucket = optional(string)
                        key    = optional(string)
                    })))
                })))
            })))
            delete_step_details  = optional(list(object({
                name                 = optional(string)
                source_file_location = optional(string)
            })))
            tag_step_details     = optional(list(object({
                name                 = optional(string)
                source_file_location = optional(string)
                tags                 = optional(list(object({
                    key   = string
                    value = string
                })))
            })))
        })))
    steps              = list(object({
            type                 = string
            copy_step_details    = optional(list(object({
                name                      = optional(string)
                overwrite_existing        = optional(string)
                source_file_location      = optional(string)
                destination_file_location = optional(list(object({
                    efs_file_location = optional(list(object({
                        file_system_id = optional(string)
                        path           = optional(string)
                    })))
                    s3_file_location  = optional(list(object({
                        bucket = optional(string)
                        key    = optional(string)
                    })))
                })))
            })))
            custom_step_details  = optional(list(object({
                name                 = optional(string)
                source_file_location = optional(string)
                target               = optional(string)
                timeout_seconds      = optional(number)
            })))
            decrypt_step_details = optional(list(object({
                type                      = string
                name                      = optional(string)
                overwrite_existing        = optional(string)
                source_file_location      = optional(string)
                destination_file_location = optional(list(object({
                    efs_file_location = optional(list(object({
                        file_system_id = optional(string)
                        path           = optional(string)
                    })))
                    s3_file_location  = optional(list(object({
                        bucket = optional(string)
                        key    = optional(string)
                    })))
                })))
            })))
            delete_step_details  = optional(list(object({
                name                 = optional(string)
                source_file_location = optional(string)
            })))
            tag_step_details     = optional(list(object({
                name                 = optional(string)
                source_file_location = optional(string)
                tags                 = optional(list(object({
                    key   = string
                    value = string
                })))
            })))
        }))
  }))
}
