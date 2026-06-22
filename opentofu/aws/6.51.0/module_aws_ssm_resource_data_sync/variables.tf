variable "ssm_resource_data_syncs" {
  description = <<EOT
Map of ssm_resource_data_syncs, attributes below
Required:
    - name
    - s3_destination
Optional:
    - region
EOT

  type = map(object({
    name           = string
    region         = optional(string)
    s3_destination = list(object({
            bucket_name              = string
            region                   = string
            kms_key_arn              = optional(string)
            prefix                   = optional(string)
            sync_format              = optional(string)
            destination_data_sharing = optional(list(object({
                destination_data_sharing_type = optional(string)
            })))
        }))
  }))
}
