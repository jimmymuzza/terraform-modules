variable "prometheus_rule_group_namespaces" {
  description = <<EOT
Map of prometheus_rule_group_namespaces, attributes below
Required:
    - data
    - name
    - workspace_id
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    data         = string
    name         = string
    workspace_id = string
    region       = optional(string)
    tags         = optional(map(string))
    tags_all     = optional(map(string))
  }))
}
