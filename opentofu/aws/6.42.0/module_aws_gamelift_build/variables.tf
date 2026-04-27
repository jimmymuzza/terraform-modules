variable "gamelift_builds" {
  description = <<EOT
Map of gamelift_builds, attributes below
Required:
    - name
    - operating_system
    - storage_location
Optional:
    - region
    - tags
    - tags_all
    - version
EOT

  type = map(object({
    name             = string
    operating_system = string
    region           = optional(string)
    tags             = optional(map(string))
    tags_all         = optional(map(string))
    version          = optional(string)
    storage_location = list(object({
            bucket         = string
            key            = string
            role_arn       = string
            object_version = optional(string)
        }))
  }))
}
