variable "datapipeline_pipeline_definitions" {
  description = <<EOT
Map of datapipeline_pipeline_definitions, attributes below
Required:
    - pipeline_id
    - pipeline_object
Optional:
    - region
    - parameter_object
    - parameter_value
EOT

  type = map(object({
    pipeline_id      = string
    region           = optional(string)
    parameter_object = optional(set(object({
            attribute = optional(set(object({
                key          = string
                string_value = string
            })))
        })))
    parameter_value  = optional(set(object({
            string_value = string
        })))
    pipeline_object  = set(object({
            name  = string
            field = optional(set(object({
                key          = string
                ref_value    = optional(string)
                string_value = optional(string)
            })))
        }))
  }))
}
