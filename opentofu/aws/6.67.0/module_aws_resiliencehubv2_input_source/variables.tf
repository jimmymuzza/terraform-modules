variable "resiliencehubv2_input_sources" {
  description = <<EOT
Map of resiliencehubv2_input_sources, attributes below
Required:
    - service_arn
Optional:
    - region
    - resource_configuration
EOT

  type = map(object({
    service_arn            = string
    region                 = optional(string)
    resource_configuration = optional(list(object({
            cfn_stack_arn      = optional(string)
            design_file_s3_url = optional(string)
            tf_state_file_url  = optional(string)
            eks                = optional(list(object({
                cluster_arn = string
                namespaces  = set(string)
            })))
            resource_tag       = optional(set(object({
                key    = string
                values = set(string)
            })))
        })))
  }))
}
