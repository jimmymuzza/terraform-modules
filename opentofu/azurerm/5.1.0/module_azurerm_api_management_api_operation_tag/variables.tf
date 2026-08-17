variable "api_management_api_operation_tags" {
  description = <<EOT
Map of api_management_api_operation_tags, attributes below
Required:
    - api_operation_id
    - display_name
    - name
EOT

  type = map(object({
    api_operation_id = string
    display_name     = string
    name             = string
  }))
}
