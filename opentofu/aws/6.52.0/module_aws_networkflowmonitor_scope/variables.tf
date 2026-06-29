variable "networkflowmonitor_scopes" {
  description = <<EOT
Map of networkflowmonitor_scopes, attributes below
Optional:
    - region
    - tags
    - target
EOT

  type = map(object({
    region = optional(string)
    tags   = optional(map(string))
    target = optional(set(object({
            region            = string
            target_identifier = optional(list(object({
                target_type = string
                target_id   = optional(list(object({
                    account_id = string
                })))
            })))
        })))
  }))
}
