variable "gamelift_scripts" {
  description = <<EOT
Map of gamelift_scripts, attributes below
Required:
    - name
Optional:
    - region
    - tags
    - tags_all
    - version
    - zip_file
    - storage_location
EOT

  type = map(object({
    name             = string
    region           = optional(string)
    tags             = optional(map(string))
    tags_all         = optional(map(string))
    version          = optional(string)
    zip_file         = optional(string)
    storage_location = optional(list(object({
            bucket         = string
            key            = string
            role_arn       = string
            object_version = optional(string)
        })))
  }))
}
