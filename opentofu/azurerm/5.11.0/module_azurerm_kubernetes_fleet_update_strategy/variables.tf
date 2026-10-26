variable "kubernetes_fleet_update_strategies" {
  description = <<EOT
Map of kubernetes_fleet_update_strategies, attributes below
Required:
    - kubernetes_fleet_manager_id
    - name
    - stage
EOT

  type = map(object({
    kubernetes_fleet_manager_id = string
    name                        = string
    stage                       = list(object({
            name                        = string
            after_stage_wait_in_seconds = optional(number)
            group                       = list(object({
                name = string
            }))
        }))
  }))
}
