variable "storage_mover_projects" {
  description = <<EOT
Map of storage_mover_projects, attributes below
Required:
    - name
    - storage_mover_id
Optional:
    - description
EOT

  type = map(object({
    name             = string
    storage_mover_id = string
    description      = optional(string)
  }))
}
