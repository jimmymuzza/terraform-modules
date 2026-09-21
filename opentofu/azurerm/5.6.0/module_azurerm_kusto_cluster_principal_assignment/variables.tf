variable "kusto_cluster_principal_assignments" {
  description = <<EOT
Map of kusto_cluster_principal_assignments, attributes below
Required:
    - cluster_name
    - name
    - principal_id
    - principal_type
    - resource_group_name
    - role
    - tenant_id
EOT

  type = map(object({
    cluster_name        = string
    name                = string
    principal_id        = string
    principal_type      = string
    resource_group_name = string
    role                = string
    tenant_id           = string
  }))
}
