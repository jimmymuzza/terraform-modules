variable "emrcontainers_virtual_clusters" {
  description = <<EOT
Map of emrcontainers_virtual_clusters, attributes below
Required:
    - name
    - container_provider
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name               = string
    region             = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
    container_provider = list(object({
            type = string
            info = list(object({
                eks_info = list(object({
                    namespace = optional(string)
                }))
            }))
        }))
  }))
}
