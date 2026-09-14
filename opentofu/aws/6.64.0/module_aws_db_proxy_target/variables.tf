variable "db_proxy_targets" {
  description = <<EOT
Map of db_proxy_targets, attributes below
Required:
    - db_proxy_name
    - target_group_name
Optional:
    - db_cluster_identifier
    - db_instance_identifier
    - region
EOT

  type = map(object({
    db_proxy_name          = string
    target_group_name      = string
    db_cluster_identifier  = optional(string)
    db_instance_identifier = optional(string)
    region                 = optional(string)
  }))
}
