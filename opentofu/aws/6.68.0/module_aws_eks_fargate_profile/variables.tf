variable "eks_fargate_profiles" {
  description = <<EOT
Map of eks_fargate_profiles, attributes below
Required:
    - cluster_name
    - fargate_profile_name
    - pod_execution_role_arn
    - selector
Optional:
    - region
    - subnet_ids
    - tags
    - tags_all
EOT

  type = map(object({
    cluster_name           = string
    fargate_profile_name   = string
    pod_execution_role_arn = string
    region                 = optional(string)
    subnet_ids             = optional(set(string))
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
    selector               = set(object({
            namespace = string
            labels    = optional(map(string))
        }))
  }))
}
