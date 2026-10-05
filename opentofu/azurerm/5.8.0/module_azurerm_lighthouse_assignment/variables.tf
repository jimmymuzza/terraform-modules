variable "lighthouse_assignments" {
  description = <<EOT
Map of lighthouse_assignments, attributes below
Required:
    - lighthouse_definition_id
    - scope
Optional:
    - name
EOT

  type = map(object({
    lighthouse_definition_id = string
    scope                    = string
    name                     = optional(string)
  }))
}
