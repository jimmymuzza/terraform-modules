variable "datasync_location_smbs" {
  description = <<EOT
Map of datasync_location_smbs, attributes below
Required:
    - agent_arns
    - password
    - server_hostname
    - subdirectory
    - user
Optional:
    - domain
    - region
    - tags
    - tags_all
    - mount_options
EOT

  type = map(object({
    agent_arns      = set(string)
    password        = string
    server_hostname = string
    subdirectory    = string
    user            = string
    domain          = optional(string)
    region          = optional(string)
    tags            = optional(map(string))
    tags_all        = optional(map(string))
    mount_options   = optional(list(object({
            version = optional(string)
        })))
  }))
}
