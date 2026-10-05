variable "kubernetes_cluster_trusted_access_role_bindings" {
  description = <<EOT
Map of kubernetes_cluster_trusted_access_role_bindings, attributes below
Required:
    - kubernetes_cluster_id
    - name
    - roles
    - source_resource_id
EOT

  type = map(object({
    kubernetes_cluster_id = string
    name                  = string
    roles                 = list(string)
    source_resource_id    = string
  }))
}
