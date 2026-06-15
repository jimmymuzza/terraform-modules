variable "storagegateway_working_storages" {
  description = <<EOT
Map of storagegateway_working_storages, attributes below
Required:
    - disk_id
    - gateway_arn
Optional:
    - region
EOT

  type = map(object({
    disk_id     = string
    gateway_arn = string
    region      = optional(string)
  }))
}
