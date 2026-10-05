variable "datasync_location_object_storages" {
  description = <<EOT
Map of datasync_location_object_storages, attributes below
Required:
    - bucket_name
    - server_hostname
Optional:
    - access_key
    - agent_arns
    - region
    - secret_key
    - server_certificate
    - server_port
    - server_protocol
    - subdirectory
    - tags
    - tags_all
EOT

  type = map(object({
    bucket_name        = string
    server_hostname    = string
    access_key         = optional(string)
    agent_arns         = optional(set(string))
    region             = optional(string)
    secret_key         = optional(string)
    server_certificate = optional(string)
    server_port        = optional(number)
    server_protocol    = optional(string)
    subdirectory       = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
  }))
}
