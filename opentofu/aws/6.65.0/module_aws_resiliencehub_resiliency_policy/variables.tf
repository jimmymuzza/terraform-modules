variable "resiliencehub_resiliency_policies" {
  description = <<EOT
Map of resiliencehub_resiliency_policies, attributes below
Required:
    - name
    - tier
Optional:
    - data_location_constraint
    - description
    - region
    - tags
    - policy
EOT

  type = map(object({
    name                     = string
    tier                     = string
    data_location_constraint = optional(string)
    description              = optional(string)
    region                   = optional(string)
    tags                     = optional(map(string))
    policy                   = optional(list(object({
            az       = optional(list(object({
                rpo = string
                rto = string
            })))
            hardware = optional(list(object({
                rpo = string
                rto = string
            })))
            region   = optional(list(object({
                rpo = optional(string)
                rto = optional(string)
            })))
            software = optional(list(object({
                rpo = string
                rto = string
            })))
        })))
  }))
}
