variable "appfabric_ingestion_destinations" {
  description = <<EOT
Map of appfabric_ingestion_destinations, attributes below
Required:
    - app_bundle_arn
    - ingestion_arn
Optional:
    - region
    - tags
    - destination_configuration
    - processing_configuration
EOT

  type = map(object({
    app_bundle_arn            = string
    ingestion_arn             = string
    region                    = optional(string)
    tags                      = optional(map(string))
    destination_configuration = optional(list(object({
            audit_log = optional(list(object({
                destination = optional(list(object({
                    firehose_stream = optional(list(object({
                        stream_name = string
                    })))
                    s3_bucket       = optional(list(object({
                        bucket_name = string
                        prefix      = optional(string)
                    })))
                })))
            })))
        })))
    processing_configuration  = optional(list(object({
            audit_log = optional(list(object({
                format = string
                schema = string
            })))
        })))
  }))
}
