variable "osis_pipeline_endpoints" {
  description = <<EOT
Map of osis_pipeline_endpoints, attributes below
Required:
    - pipeline_arn
Optional:
    - region
    - vpc_options
EOT

  type = map(object({
    pipeline_arn = string
    region       = optional(string)
    vpc_options  = optional(list(object({
            subnet_ids         = set(string)
            security_group_ids = optional(set(string))
        })))
  }))
}
