variable "ecs_cluster_capacity_providers" {
  description = <<EOT
Map of ecs_cluster_capacity_providers, attributes below
Required:
    - cluster_name
Optional:
    - capacity_providers
    - region
    - default_capacity_provider_strategy
EOT

  type = map(object({
    cluster_name                       = string
    capacity_providers                 = optional(set(string))
    region                             = optional(string)
    default_capacity_provider_strategy = optional(set(object({
            capacity_provider = string
            base              = optional(number)
            weight            = optional(number)
        })))
  }))
}
