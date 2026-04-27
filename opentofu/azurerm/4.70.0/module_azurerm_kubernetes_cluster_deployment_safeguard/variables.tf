variable "kubernetes_cluster_deployment_safeguards" {
  description = <<EOT
Map of kubernetes_cluster_deployment_safeguards, attributes below
Required:
    - kubernetes_cluster_id
    - level
Optional:
    - excluded_namespaces
    - pod_security_standards_level
EOT

  type = map(object({
    kubernetes_cluster_id        = string
    level                        = string
    excluded_namespaces          = optional(list(string))
    pod_security_standards_level = optional(string)
  }))
}
