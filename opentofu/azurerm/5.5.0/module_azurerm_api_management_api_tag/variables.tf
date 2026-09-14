variable "api_management_api_tags" {
  description = <<EOT
Map of api_management_api_tags, attributes below
Required:
    - api_id
    - name
EOT

  type = map(object({
    api_id = string
    name   = string
  }))
}
