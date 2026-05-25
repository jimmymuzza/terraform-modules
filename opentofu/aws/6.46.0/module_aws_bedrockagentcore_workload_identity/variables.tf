variable "bedrockagentcore_workload_identities" {
  description = <<EOT
Map of bedrockagentcore_workload_identities, attributes below
Required:
    - name
Optional:
    - allowed_resource_oauth2_return_urls
    - region
EOT

  type = map(object({
    name                                = string
    allowed_resource_oauth2_return_urls = optional(set(string))
    region                              = optional(string)
  }))
}
