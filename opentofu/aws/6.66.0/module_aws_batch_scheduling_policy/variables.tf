variable "batch_scheduling_policies" {
  description = <<EOT
Map of batch_scheduling_policies, attributes below
Required:
    - name
Optional:
    - region
    - tags
    - tags_all
    - fair_share_policy
EOT

  type = map(object({
    name              = string
    region            = optional(string)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
    fair_share_policy = optional(list(object({
            compute_reservation = optional(number)
            share_decay_seconds = optional(number)
            share_distribution  = optional(set(object({
                share_identifier = string
                weight_factor    = optional(number)
            })))
        })))
  }))
}
