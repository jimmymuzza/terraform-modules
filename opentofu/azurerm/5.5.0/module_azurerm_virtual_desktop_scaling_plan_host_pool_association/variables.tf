variable "virtual_desktop_scaling_plan_host_pool_associations" {
  description = <<EOT
Map of virtual_desktop_scaling_plan_host_pool_associations, attributes below
Required:
    - enabled
    - host_pool_id
    - scaling_plan_id
EOT

  type = map(object({
    enabled         = bool
    host_pool_id    = string
    scaling_plan_id = string
  }))
}
