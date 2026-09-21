variable "kubernetes_fleet_members" {
  description = <<EOT
Map of kubernetes_fleet_members, attributes below
Required:
    - kubernetes_cluster_id
    - kubernetes_fleet_id
    - name
Optional:
    - group
EOT

  type = map(object({
    kubernetes_cluster_id = string
    kubernetes_fleet_id   = string
    name                  = string
    group                 = optional(string)
  }))
}
