variable "devicefarm_device_pools" {
  description = <<EOT
Map of devicefarm_device_pools, attributes below
Required:
    - name
    - project_arn
    - rule
Optional:
    - description
    - max_devices
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name        = string
    project_arn = string
    description = optional(string)
    max_devices = optional(number)
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
    rule        = set(object({
            attribute = optional(string)
            operator  = optional(string)
            value     = optional(string)
        }))
  }))
}
