variable "sagemaker_hubs" {
  description = <<EOT
Map of sagemaker_hubs, attributes below
Required:
    - hub_description
    - hub_name
Optional:
    - hub_display_name
    - hub_search_keywords
    - region
    - tags
    - tags_all
    - s3_storage_config
EOT

  type = map(object({
    hub_description     = string
    hub_name            = string
    hub_display_name    = optional(string)
    hub_search_keywords = optional(set(string))
    region              = optional(string)
    tags                = optional(map(string))
    tags_all            = optional(map(string))
    s3_storage_config   = optional(list(object({
            s3_output_path = optional(string)
        })))
  }))
}
