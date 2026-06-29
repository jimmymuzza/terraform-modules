variable "iam_server_certificates" {
  description = <<EOT
Map of iam_server_certificates, attributes below
Required:
    - certificate_body
    - private_key
Optional:
    - certificate_chain
    - name
    - name_prefix
    - path
    - tags
    - tags_all
EOT

  type = map(object({
    certificate_body  = string
    private_key       = string
    certificate_chain = optional(string)
    name              = optional(string)
    name_prefix       = optional(string)
    path              = optional(string)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
  }))
}
