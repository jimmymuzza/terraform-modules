variable "storagegateway_upload_buffers" {
  description = <<EOT
Map of storagegateway_upload_buffers, attributes below
Required:
    - gateway_arn
Optional:
    - disk_id
    - disk_path
    - region
EOT

  type = map(object({
    gateway_arn = string
    disk_id     = optional(string)
    disk_path   = optional(string)
    region      = optional(string)
  }))
}
