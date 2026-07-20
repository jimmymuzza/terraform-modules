variable "kinesis_stream_consumers" {
  description = <<EOT
Map of kinesis_stream_consumers, attributes below
Required:
    - name
    - stream_arn
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name       = string
    stream_arn = string
    region     = optional(string)
    tags       = optional(map(string))
    tags_all   = optional(map(string))
  }))
}
