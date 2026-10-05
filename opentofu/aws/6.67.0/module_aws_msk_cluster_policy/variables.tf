variable "msk_cluster_policies" {
  description = <<EOT
Map of msk_cluster_policies, attributes below
Required:
    - cluster_arn
    - policy
Optional:
    - region
EOT

  type = map(object({
    cluster_arn = string
    policy      = string
    region      = optional(string)
  }))
}
