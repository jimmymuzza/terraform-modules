variable "transcribe_vocabulary_filters" {
  description = <<EOT
Map of transcribe_vocabulary_filters, attributes below
Required:
    - language_code
    - vocabulary_filter_name
Optional:
    - region
    - tags
    - tags_all
    - vocabulary_filter_file_uri
    - words
EOT

  type = map(object({
    language_code              = string
    vocabulary_filter_name     = string
    region                     = optional(string)
    tags                       = optional(map(string))
    tags_all                   = optional(map(string))
    vocabulary_filter_file_uri = optional(string)
    words                      = optional(list(string))
  }))
}
