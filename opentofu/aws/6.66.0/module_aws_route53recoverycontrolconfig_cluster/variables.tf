variable "route53recoverycontrolconfig_clusters" {
  description = <<EOT
Map of route53recoverycontrolconfig_clusters, attributes below
Required:
    - name
Optional:
    - network_type
    - tags
    - tags_all
EOT

  type = map(object({
    name         = string
    network_type = optional(string)
    tags         = optional(map(string))
    tags_all     = optional(map(string))
  }))
}
