variable "nginx_api_keys" {
  description = <<EOT
Map of nginx_api_keys, attributes below
Required:
    - end_date_time
    - name
    - nginx_deployment_id
    - secret_text
EOT

  type = map(object({
    end_date_time       = string
    name                = string
    nginx_deployment_id = string
    secret_text         = string
  }))
}
