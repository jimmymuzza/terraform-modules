variable "datapipeline_pipelines" {
  description = <<EOT
Map of datapipeline_pipelines, attributes below
Required:
    - name
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name        = string
    description = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
  }))
}
