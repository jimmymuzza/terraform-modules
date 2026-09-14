variable "storagegateway_caches" {
  description = <<EOT
Map of storagegateway_caches, attributes below
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
