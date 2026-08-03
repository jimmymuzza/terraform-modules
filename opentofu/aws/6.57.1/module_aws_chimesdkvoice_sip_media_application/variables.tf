variable "chimesdkvoice_sip_media_applications" {
  description = <<EOT
Map of chimesdkvoice_sip_media_applications, attributes below
Required:
    - aws_region
    - name
    - endpoints
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    aws_region = string
    name       = string
    region     = optional(string)
    tags       = optional(map(string))
    tags_all   = optional(map(string))
    endpoints  = list(object({
            lambda_arn = string
        }))
  }))
}
