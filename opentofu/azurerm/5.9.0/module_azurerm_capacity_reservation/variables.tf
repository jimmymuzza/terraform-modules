variable "capacity_reservations" {
  description = <<EOT
Map of capacity_reservations, attributes below
Required:
    - capacity_reservation_group_id
    - name
    - sku
Optional:
    - tags
    - zone
EOT

  type = map(object({
    capacity_reservation_group_id = string
    name                          = string
    tags                          = optional(map(string))
    zone                          = optional(string)
    sku                           = list(object({
            capacity = number
            name     = string
        }))
  }))
}
