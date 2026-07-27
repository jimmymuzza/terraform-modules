variable "devicefarm_test_grid_projects" {
  description = <<EOT
Map of devicefarm_test_grid_projects, attributes below
Required:
    - name
Optional:
    - description
    - region
    - tags
    - tags_all
    - vpc_config
EOT

  type = map(object({
    name        = string
    description = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
    vpc_config  = optional(list(object({
            security_group_ids = set(string)
            subnet_ids         = set(string)
            vpc_id             = string
        })))
  }))
}
