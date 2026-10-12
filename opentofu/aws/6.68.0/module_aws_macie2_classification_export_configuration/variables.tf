variable "macie2_classification_export_configurations" {
  description = <<EOT
Map of macie2_classification_export_configurations, attributes below
Required:
    - s3_destination
Optional:
    - region
EOT

  type = map(object({
    region         = optional(string)
    s3_destination = list(object({
            bucket_name = string
            kms_key_arn = string
            key_prefix  = optional(string)
        }))
  }))
}
