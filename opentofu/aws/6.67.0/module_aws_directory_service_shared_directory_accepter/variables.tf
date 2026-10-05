variable "directory_service_shared_directory_accepters" {
  description = <<EOT
Map of directory_service_shared_directory_accepters, attributes below
Required:
    - shared_directory_id
Optional:
    - region
EOT

  type = map(object({
    shared_directory_id = string
    region              = optional(string)
  }))
}
