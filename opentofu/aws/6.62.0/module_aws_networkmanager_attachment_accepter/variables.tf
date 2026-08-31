variable "networkmanager_attachment_accepters" {
  description = <<EOT
Map of networkmanager_attachment_accepters, attributes below
Required:
    - attachment_id
    - attachment_type
EOT

  type = map(object({
    attachment_id   = string
    attachment_type = string
  }))
}
