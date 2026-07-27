variable "keyspaces_keyspaces" {
  description = <<EOT
Map of keyspaces_keyspaces, attributes below
Required:
    - name
Optional:
    - region
    - tags
    - tags_all
    - replication_specification
EOT

  type = map(object({
    name                      = string
    region                    = optional(string)
    tags                      = optional(map(string))
    tags_all                  = optional(map(string))
    replication_specification = optional(list(object({
            region_list          = optional(set(string))
            replication_strategy = optional(string)
        })))
  }))
}
