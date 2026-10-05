variable "kubernetes_fleet_update_runs" {
  description = <<EOT
Map of kubernetes_fleet_update_runs, attributes below
Required:
    - kubernetes_fleet_manager_id
    - name
    - managed_cluster_update
Optional:
    - fleet_update_strategy_id
    - stage
EOT

  type = map(object({
    kubernetes_fleet_manager_id = string
    name                        = string
    fleet_update_strategy_id    = optional(string)
    managed_cluster_update      = list(object({
            node_image_selection = optional(list(object({
                type = string
            })))
            upgrade              = list(object({
                type               = string
                kubernetes_version = optional(string)
            }))
        }))
    stage                       = optional(list(object({
            name                        = string
            after_stage_wait_in_seconds = optional(number)
            group                       = list(object({
                name = string
            }))
        })))
  }))
}
