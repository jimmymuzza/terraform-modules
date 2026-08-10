variable "serverlessapplicationrepository_cloudformation_stacks" {
  description = <<EOT
Map of serverlessapplicationrepository_cloudformation_stacks, attributes below
Required:
    - application_id
    - name
Optional:
    - capabilities
    - parameters
    - region
    - semantic_version
    - tags
    - tags_all
EOT

  type = map(object({
    application_id   = string
    name             = string
    capabilities     = optional(set(string))
    parameters       = optional(map(string))
    region           = optional(string)
    semantic_version = optional(string)
    tags             = optional(map(string))
    tags_all         = optional(map(string))
  }))
}
