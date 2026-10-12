variable "application_load_balancer_subnet_associations" {
  description = <<EOT
Map of application_load_balancer_subnet_associations, attributes below
Required:
    - application_load_balancer_id
    - name
    - subnet_id
Optional:
    - tags
EOT

  type = map(object({
    application_load_balancer_id = string
    name                         = string
    subnet_id                    = string
    tags                         = optional(map(string))
  }))
}
