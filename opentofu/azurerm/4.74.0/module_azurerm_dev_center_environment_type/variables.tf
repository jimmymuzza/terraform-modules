variable "dev_center_environment_types" {
  description = <<EOT
Map of dev_center_environment_types, attributes below
Required:
    - dev_center_id
    - name
Optional:
    - tags
EOT

  type = map(object({
    dev_center_id = string
    name          = string
    tags          = optional(map(string))
  }))
}
