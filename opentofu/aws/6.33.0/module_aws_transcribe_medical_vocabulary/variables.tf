variable "transcribe_medical_vocabularies" {
  description = <<EOT
Map of transcribe_medical_vocabularies, attributes below
Required:
    - language_code
    - vocabulary_file_uri
    - vocabulary_name
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    language_code       = string
    vocabulary_file_uri = string
    vocabulary_name     = string
    region              = optional(string)
    tags                = optional(map(string))
    tags_all            = optional(map(string))
  }))
}
