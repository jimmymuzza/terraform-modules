variable "s3vectors_indexes" {
  description = <<EOT
Map of s3vectors_indexes, attributes below
Required:
    - data_type
    - dimension
    - distance_metric
    - index_name
    - vector_bucket_name
Optional:
    - encryption_configuration
    - region
    - tags
    - metadata_configuration
EOT

  type = map(object({
    data_type                = string
    dimension                = number
    distance_metric          = string
    index_name               = string
    vector_bucket_name       = string
    encryption_configuration = optional(list(object({
            kms_key_arn = string
            sse_type = string
        })))
    region                   = optional(string)
    tags                     = optional(map(string))
    metadata_configuration   = optional(list(object({
            non_filterable_metadata_keys = set(string)
        })))
  }))
}
