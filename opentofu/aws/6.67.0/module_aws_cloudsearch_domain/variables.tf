variable "cloudsearch_domains" {
  description = <<EOT
Map of cloudsearch_domains, attributes below
Required:
    - name
Optional:
    - multi_az
    - region
    - endpoint_options
    - index_field
    - scaling_parameters
EOT

  type = map(object({
    name               = string
    multi_az           = optional(bool)
    region             = optional(string)
    endpoint_options   = optional(list(object({
            enforce_https       = optional(bool)
            tls_security_policy = optional(string)
        })))
    index_field        = optional(set(object({
            name            = string
            type            = string
            analysis_scheme = optional(string)
            default_value   = optional(string)
            facet           = optional(bool)
            highlight       = optional(bool)
            return          = optional(bool)
            search          = optional(bool)
            sort            = optional(bool)
            source_fields   = optional(string)
        })))
    scaling_parameters = optional(list(object({
            desired_instance_type     = optional(string)
            desired_partition_count   = optional(number)
            desired_replication_count = optional(number)
        })))
  }))
}
