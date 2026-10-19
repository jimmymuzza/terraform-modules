variable "api_management_api_releases" {
  description = <<EOT
Map of api_management_api_releases, attributes below
Required:
    - api_id
    - name
Optional:
    - notes
EOT

  type = map(object({
    api_id = string
    name   = string
    notes  = optional(string)
  }))
}
