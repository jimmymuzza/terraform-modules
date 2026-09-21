variable "msk_serverless_clusters" {
  description = <<EOT
Map of msk_serverless_clusters, attributes below
Required:
    - cluster_name
    - client_authentication
    - vpc_config
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    cluster_name          = string
    region                = optional(string)
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
    client_authentication = list(object({
            sasl = list(object({
                iam = list(object({
                    enabled = bool
                }))
            }))
        }))
    vpc_config            = list(object({
            subnet_ids         = set(string)
            security_group_ids = optional(set(string))
        }))
  }))
}
