variable "backup_global_settings" {
  description = <<EOT
Map of backup_global_settings, attributes below
Required:
    - global_settings
EOT

  type = map(object({
    global_settings = map(string)
  }))
}
