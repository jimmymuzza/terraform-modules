variable "advisor_suppressions" {
  description = <<EOT
Map of advisor_suppressions, attributes below
Required:
    - name
    - recommendation_id
    - resource_id
Optional:
    - ttl
EOT

  type = map(object({
    name              = string
    recommendation_id = string
    resource_id       = string
    ttl               = optional(string)
  }))
}
