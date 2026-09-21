variable "rekognition_projects" {
  description = <<EOT
Map of rekognition_projects, attributes below
Required:
    - name
Optional:
    - auto_update
    - feature
    - region
    - tags
EOT

  type = map(object({
    name        = string
    auto_update = optional(string)
    feature     = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
  }))
}
