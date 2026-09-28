variable "api_management_tags" {
  description = <<EOT
Map of api_management_tags, attributes below
Required:
    - api_management_id
    - name
Optional:
    - display_name
EOT

  type = map(object({
    api_management_id = string
    name              = string
    display_name      = optional(string)
  }))
}
