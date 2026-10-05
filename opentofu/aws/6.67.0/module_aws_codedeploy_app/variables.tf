variable "codedeploy_apps" {
  description = <<EOT
Map of codedeploy_apps, attributes below
Required:
    - name
Optional:
    - compute_platform
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name             = string
    compute_platform = optional(string)
    region           = optional(string)
    tags             = optional(map(string))
    tags_all         = optional(map(string))
  }))
}
