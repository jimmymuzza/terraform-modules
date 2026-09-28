variable "rds_instance_states" {
  description = <<EOT
Map of rds_instance_states, attributes below
Required:
    - identifier
    - state
Optional:
    - region
EOT

  type = map(object({
    identifier = string
    state      = string
    region     = optional(string)
  }))
}
