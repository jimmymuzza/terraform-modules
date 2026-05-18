variable "web_pubsub_network_acls" {
  description = <<EOT
Map of web_pubsub_network_acls, attributes below
Required:
    - web_pubsub_id
    - public_network
Optional:
    - default_action
    - private_endpoint
EOT

  type = map(object({
    web_pubsub_id    = string
    default_action   = optional(string)
    private_endpoint = optional(set(object({
            allowed_request_types = optional(set(string))
            denied_request_types  = optional(set(string))
        })))
    public_network   = list(object({
            allowed_request_types = optional(set(string))
            denied_request_types  = optional(set(string))
        }))
  }))
}
