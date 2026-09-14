variable "application_load_balancer_frontends" {
  description = <<EOT
Map of application_load_balancer_frontends, attributes below
Required:
    - application_load_balancer_id
    - name
Optional:
    - tags
EOT

  type = map(object({
    application_load_balancer_id = string
    name                         = string
    tags                         = optional(map(string))
  }))
}
