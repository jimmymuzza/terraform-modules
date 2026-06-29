variable "resourceexplorer2_indexes" {
  description = <<EOT
Map of resourceexplorer2_indexes, attributes below
Required:
    - type
Optional:
    - region
    - tags
EOT

  type = map(object({
    type   = string
    region = optional(string)
    tags   = optional(map(string))
  }))
}
