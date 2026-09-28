variable "glacier_vaults" {
  description = <<EOT
Map of glacier_vaults, attributes below
Required:
    - name
Optional:
    - access_policy
    - region
    - tags
    - tags_all
    - notification
EOT

  type = map(object({
    name          = string
    access_policy = optional(string)
    region        = optional(string)
    tags          = optional(map(string))
    tags_all      = optional(map(string))
    notification  = optional(list(object({
            events    = set(string)
            sns_topic = string
        })))
  }))
}
