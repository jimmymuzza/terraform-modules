variable "config_conformance_packs" {
  description = <<EOT
Map of config_conformance_packs, attributes below
Required:
    - name
Optional:
    - delivery_s3_bucket
    - delivery_s3_key_prefix
    - region
    - template_body
    - template_s3_uri
    - input_parameter
EOT

  type = map(object({
    name                   = string
    delivery_s3_bucket     = optional(string)
    delivery_s3_key_prefix = optional(string)
    region                 = optional(string)
    template_body          = optional(string)
    template_s3_uri        = optional(string)
    input_parameter        = optional(set(object({
            parameter_name  = string
            parameter_value = string
        })))
  }))
}
