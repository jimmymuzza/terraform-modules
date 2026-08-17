variable "datasync_location_nfs" {
  description = <<EOT
Map of datasync_location_nfs, attributes below
Required:
    - server_hostname
    - subdirectory
    - on_prem_config
Optional:
    - region
    - tags
    - tags_all
    - mount_options
EOT

  type = map(object({
    server_hostname = string
    subdirectory    = string
    region          = optional(string)
    tags            = optional(map(string))
    tags_all        = optional(map(string))
    mount_options   = optional(list(object({
            version = optional(string)
        })))
    on_prem_config  = list(object({
            agent_arns = set(string)
        }))
  }))
}
