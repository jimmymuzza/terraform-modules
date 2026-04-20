variable "sagemaker_notebook_instance_lifecycle_configurations" {
  description = <<EOT
Map of sagemaker_notebook_instance_lifecycle_configurations, attributes below
Optional:
    - name
    - on_create
    - on_start
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name      = optional(string)
    on_create = optional(string)
    on_start  = optional(string)
    region    = optional(string)
    tags      = optional(map(string))
    tags_all  = optional(map(string))
  }))
}
