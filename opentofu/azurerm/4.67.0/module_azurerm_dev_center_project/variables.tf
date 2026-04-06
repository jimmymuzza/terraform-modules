variable "dev_center_projects" {
  description = <<EOT
Map of dev_center_projects, attributes below
Required:
    - dev_center_id
    - location
    - name
    - resource_group_name
Optional:
    - description
    - maximum_dev_boxes_per_user
    - tags
    - identity
EOT

  type = map(object({
    dev_center_id              = string
    location                   = string
    name                       = string
    resource_group_name        = string
    description                = optional(string)
    maximum_dev_boxes_per_user = optional(number)
    tags                       = optional(map(string))
    identity                   = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
  }))
}
