variable "s3_bucket_replication_configurations" {
  description = <<EOT
Map of s3_bucket_replication_configurations, attributes below
Required:
    - bucket
    - role
    - rule
Optional:
    - region
    - token
EOT

  type = map(object({
    bucket = string
    role   = string
    region = optional(string)
    token  = optional(string)
    rule   = list(object({
            status                      = string
            prefix                      = optional(string)
            priority                    = optional(number)
            delete_marker_replication   = optional(list(object({
                status = string
            })))
            destination                 = list(object({
                bucket                     = string
                account                    = optional(string)
                storage_class              = optional(string)
                access_control_translation = optional(list(object({
                    owner = string
                })))
                encryption_configuration   = optional(list(object({
                    replica_kms_key_id = string
                })))
                metrics                    = optional(list(object({
                    status          = string
                    event_threshold = optional(list(object({
                        minutes = number
                    })))
                })))
                replication_time           = optional(list(object({
                    status = string
                    time   = list(object({
                        minutes = number
                    }))
                })))
            }))
            existing_object_replication = optional(list(object({
                status = string
            })))
            filter                      = optional(list(object({
                prefix = optional(string)
                and    = optional(list(object({
                    prefix = optional(string)
                    tags   = optional(map(string))
                })))
                tag    = optional(list(object({
                    key   = string
                    value = string
                })))
            })))
            source_selection_criteria   = optional(list(object({
                replica_modifications     = optional(list(object({
                    status = string
                })))
                sse_kms_encrypted_objects = optional(list(object({
                    status = string
                })))
            })))
        }))
  }))
}
