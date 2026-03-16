variable "lambda_layer_versions" {
  description = <<EOT
Map of lambda_layer_versions, attributes below
Required:
    - layer_name
Optional:
    - compatible_architectures
    - compatible_runtimes
    - description
    - filename
    - license_info
    - region
    - s3_bucket
    - s3_key
    - s3_object_version
    - skip_destroy
    - source_code_hash
EOT

  type = map(object({
    layer_name               = string
    compatible_architectures = optional(set(string))
    compatible_runtimes      = optional(set(string))
    description              = optional(string)
    filename                 = optional(string)
    license_info             = optional(string)
    region                   = optional(string)
    s3_bucket                = optional(string)
    s3_key                   = optional(string)
    s3_object_version        = optional(string)
    skip_destroy             = optional(bool)
    source_code_hash         = optional(string)
  }))
}
