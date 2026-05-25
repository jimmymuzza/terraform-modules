variable "athena_capacity_reservations" {
  description = <<EOT
Map of athena_capacity_reservations, attributes below
Required:
    - name
    - target_dpus
Optional:
    - region
    - tags
EOT

  type = map(object({
    name        = string
    target_dpus = number
    region      = optional(string)
    tags        = optional(map(string))
  }))
}
