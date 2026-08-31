variable "servicequotas_template_associations" {
  description = <<EOT
Map of servicequotas_template_associations, attributes below
Optional:
    - region
    - skip_destroy
EOT

  type = map(object({
    region       = optional(string)
    skip_destroy = optional(bool)
  }))
}
