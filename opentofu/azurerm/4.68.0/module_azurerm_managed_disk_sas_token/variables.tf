variable "managed_disk_sas_tokens" {
  description = <<EOT
Map of managed_disk_sas_tokens, attributes below
Required:
    - access_level
    - duration_in_seconds
    - managed_disk_id
EOT

  type = map(object({
    access_level        = string
    duration_in_seconds = number
    managed_disk_id     = string
  }))
}
