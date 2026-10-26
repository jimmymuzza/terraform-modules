variable "cloudwatchomni_views" {
  description = <<EOT
Map of cloudwatchomni_views, attributes below
Required:
    - definition
    - name
Optional:
    - description
    - region
    - tags
EOT

  type = map(object({
    definition  = string
    name        = string
    description = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
  }))
}
