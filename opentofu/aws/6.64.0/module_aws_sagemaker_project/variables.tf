variable "sagemaker_projects" {
  description = <<EOT
Map of sagemaker_projects, attributes below
Required:
    - project_name
    - service_catalog_provisioning_details
Optional:
    - project_description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    project_name                         = string
    project_description                  = optional(string)
    region                               = optional(string)
    tags                                 = optional(map(string))
    tags_all                             = optional(map(string))
    service_catalog_provisioning_details = list(object({
            product_id               = string
            path_id                  = optional(string)
            provisioning_artifact_id = optional(string)
            provisioning_parameter   = optional(list(object({
                key   = string
                value = optional(string)
            })))
        }))
  }))
}
