variable "codepipeline_custom_action_types" {
  description = <<EOT
Map of codepipeline_custom_action_types, attributes below
Required:
    - category
    - provider_name
    - version
    - input_artifact_details
    - output_artifact_details
Optional:
    - region
    - tags
    - tags_all
    - configuration_property
    - settings
EOT

  type = map(object({
    category                = string
    provider_name           = string
    version                 = string
    region                  = optional(string)
    tags                    = optional(map(string))
    tags_all                = optional(map(string))
    configuration_property  = optional(list(object({
            key         = bool
            name        = string
            required    = bool
            secret      = bool
            description = optional(string)
            queryable   = optional(bool)
            type        = optional(string)
        })))
    input_artifact_details  = list(object({
            maximum_count = number
            minimum_count = number
        }))
    output_artifact_details = list(object({
            maximum_count = number
            minimum_count = number
        }))
    settings                = optional(list(object({
            entity_url_template           = optional(string)
            execution_url_template        = optional(string)
            revision_url_template         = optional(string)
            third_party_configuration_url = optional(string)
        })))
  }))
}
