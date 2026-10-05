variable "media_store_containers" {
  description = <<EOT
Map of media_store_containers, attributes below
Required:
    - name
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name     = string
    region   = optional(string)
    tags     = optional(map(string))
    tags_all = optional(map(string))
  }))
}
