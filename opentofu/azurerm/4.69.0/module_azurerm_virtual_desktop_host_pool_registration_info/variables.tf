variable "virtual_desktop_host_pool_registration_infos" {
  description = <<EOT
Map of virtual_desktop_host_pool_registration_infos, attributes below
Required:
    - expiration_date
    - hostpool_id
EOT

  type = map(object({
    expiration_date = string
    hostpool_id     = string
  }))
}
