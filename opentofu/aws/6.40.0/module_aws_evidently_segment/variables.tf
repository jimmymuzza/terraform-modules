variable "evidently_segments" {
  description = <<EOT
Map of evidently_segments, attributes below
Required:
    - name
    - pattern
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name        = string
    pattern     = string
    description = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
  }))
}
