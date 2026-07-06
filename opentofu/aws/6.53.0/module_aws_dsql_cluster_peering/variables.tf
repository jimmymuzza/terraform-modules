variable "dsql_cluster_peerings" {
  description = <<EOT
Map of dsql_cluster_peerings, attributes below
Required:
    - clusters
    - identifier
    - witness_region
Optional:
    - region
EOT

  type = map(object({
    clusters       = set(string)
    identifier     = string
    witness_region = string
    region         = optional(string)
  }))
}
