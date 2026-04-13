variable "mskconnect_worker_configurations" {
  description = <<EOT
Map of mskconnect_worker_configurations, attributes below
Required:
    - name
    - properties_file_content
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name                    = string
    properties_file_content = string
    description             = optional(string)
    region                  = optional(string)
    tags                    = optional(map(string))
    tags_all                = optional(map(string))
  }))
}
