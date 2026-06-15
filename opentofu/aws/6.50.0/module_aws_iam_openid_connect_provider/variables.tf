variable "iam_openid_connect_providers" {
  description = <<EOT
Map of iam_openid_connect_providers, attributes below
Required:
    - client_id_list
    - url
Optional:
    - tags
    - tags_all
    - thumbprint_list
EOT

  type = map(object({
    client_id_list  = set(string)
    url             = string
    tags            = optional(map(string))
    tags_all        = optional(map(string))
    thumbprint_list = optional(list(string))
  }))
}
