variable "directory_service_shared_directories" {
  description = <<EOT
Map of directory_service_shared_directories, attributes below
Required:
    - directory_id
    - target
Optional:
    - method
    - notes
    - region
EOT

  type = map(object({
    directory_id = string
    method       = optional(string)
    notes        = optional(string)
    region       = optional(string)
    target       = list(object({
            type = optional(string)
        }))
  }))
}
