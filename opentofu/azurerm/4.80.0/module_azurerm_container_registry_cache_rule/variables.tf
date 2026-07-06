variable "container_registry_cache_rules" {
  description = <<EOT
Map of container_registry_cache_rules, attributes below
Required:
    - container_registry_id
    - name
    - source_repo
    - target_repo
Optional:
    - credential_set_id
EOT

  type = map(object({
    container_registry_id = string
    name                  = string
    source_repo           = string
    target_repo           = string
    credential_set_id     = optional(string)
  }))
}
