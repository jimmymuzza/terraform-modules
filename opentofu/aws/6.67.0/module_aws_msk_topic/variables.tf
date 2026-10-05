variable "msk_topics" {
  description = <<EOT
Map of msk_topics, attributes below
Required:
    - cluster_arn
    - name
    - partition_count
    - replication_factor
Optional:
    - configs
    - region
EOT

  type = map(object({
    cluster_arn        = string
    name               = string
    partition_count    = number
    replication_factor = number
    configs            = optional(string)
    region             = optional(string)
  }))
}
