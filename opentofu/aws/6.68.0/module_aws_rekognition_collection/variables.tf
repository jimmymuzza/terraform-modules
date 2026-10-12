variable "rekognition_collections" {
  description = <<EOT
Map of rekognition_collections, attributes below
Required:
    - collection_id
Optional:
    - region
    - tags
EOT

  type = map(object({
    collection_id = string
    region        = optional(string)
    tags          = optional(map(string))
  }))
}
