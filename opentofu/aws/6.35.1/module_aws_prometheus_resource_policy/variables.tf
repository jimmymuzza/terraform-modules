variable "prometheus_resource_policies" {
  description = <<EOT
Map of prometheus_resource_policies, attributes below
Required:
    - policy_document
    - workspace_id
Optional:
    - region
    - revision_id
EOT

  type = map(object({
    policy_document = string
    workspace_id    = string
    region          = optional(string)
    revision_id     = optional(string)
  }))
}
