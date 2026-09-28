variable "transcribe_vocabularies" {
  description = <<EOT
Map of transcribe_vocabularies, attributes below
Required:
    - language_code
    - vocabulary_name
Optional:
    - phrases
    - region
    - tags
    - tags_all
    - vocabulary_file_uri
EOT

  type = map(object({
    language_code       = string
    vocabulary_name     = string
    phrases             = optional(list(string))
    region              = optional(string)
    tags                = optional(map(string))
    tags_all            = optional(map(string))
    vocabulary_file_uri = optional(string)
  }))
}
