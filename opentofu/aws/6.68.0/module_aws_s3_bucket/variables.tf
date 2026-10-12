variable "s3_buckets" {
  description = <<EOT
Map of s3_buckets, attributes below
Optional:
    - acceleration_status
    - acl
    - bucket
    - bucket_namespace
    - bucket_prefix
    - force_destroy
    - object_lock_enabled
    - policy
    - region
    - request_payer
    - tags
    - tags_all
    - cors_rule
    - grant
    - lifecycle_rule
    - logging
    - object_lock_configuration
    - replication_configuration
    - server_side_encryption_configuration
    - versioning
    - website
EOT

  type = map(object({
    acceleration_status                  = optional(string)
    acl                                  = optional(string)
    bucket                               = optional(string)
    bucket_namespace                     = optional(string)
    bucket_prefix                        = optional(string)
    force_destroy                        = optional(bool)
    object_lock_enabled                  = optional(bool)
    policy                               = optional(string)
    region                               = optional(string)
    request_payer                        = optional(string)
    tags                                 = optional(map(string))
    tags_all                             = optional(map(string))
    cors_rule                            = optional(list(object({
            allowed_methods = list(string)
            allowed_origins = list(string)
            allowed_headers = optional(list(string))
            expose_headers  = optional(list(string))
            max_age_seconds = optional(number)
        })))
    grant                                = optional(set(object({
            permissions = set(string)
            type        = string
            uri         = optional(string)
        })))
    lifecycle_rule                       = optional(list(object({
            enabled                                = bool
            abort_incomplete_multipart_upload_days = optional(number)
            prefix                                 = optional(string)
            tags                                   = optional(map(string))
            expiration                             = optional(list(object({
                date                         = optional(string)
                days                         = optional(number)
                expired_object_delete_marker = optional(bool)
            })))
            noncurrent_version_expiration          = optional(list(object({
                days = optional(number)
            })))
            noncurrent_version_transition          = optional(set(object({
                storage_class = string
                days          = optional(number)
            })))
            transition                             = optional(set(object({
                storage_class = string
                date          = optional(string)
                days          = optional(number)
            })))
        })))
    logging                              = optional(list(object({
            target_bucket = string
            target_prefix = optional(string)
        })))
    object_lock_configuration            = optional(list(object({
            object_lock_enabled = optional(string)
            rule                = optional(list(object({
                default_retention = list(object({
                    mode  = string
                    days  = optional(number)
                    years = optional(number)
                }))
            })))
        })))
    replication_configuration            = optional(list(object({
            role  = string
            rules = set(object({
                status                           = string
                delete_marker_replication_status = optional(string)
                prefix                           = optional(string)
                priority                         = optional(number)
                destination                      = list(object({
                    bucket                     = string
                    account_id                 = optional(string)
                    replica_kms_key_id         = optional(string)
                    storage_class              = optional(string)
                    access_control_translation = optional(list(object({
                        owner = string
                    })))
                    metrics                    = optional(list(object({
                        minutes = optional(number)
                        status  = optional(string)
                    })))
                    replication_time           = optional(list(object({
                        minutes = optional(number)
                        status  = optional(string)
                    })))
                }))
                filter                           = optional(list(object({
                    prefix = optional(string)
                    tags   = optional(map(string))
                })))
                source_selection_criteria        = optional(list(object({
                    sse_kms_encrypted_objects = optional(list(object({
                        enabled = bool
                    })))
                })))
            }))
        })))
    server_side_encryption_configuration = optional(list(object({
            rule = list(object({
                bucket_key_enabled                      = optional(bool)
                apply_server_side_encryption_by_default = list(object({
                    sse_algorithm     = string
                    kms_master_key_id = optional(string)
                }))
            }))
        })))
    versioning                           = optional(list(object({
            enabled    = optional(bool)
            mfa_delete = optional(bool)
        })))
    website                              = optional(list(object({
            error_document           = optional(string)
            index_document           = optional(string)
            redirect_all_requests_to = optional(string)
            routing_rules            = optional(string)
        })))
  }))
}
