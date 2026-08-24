variable "signalr_service_network_acls" {
  description = <<EOT
Map of signalr_service_network_acls, attributes below
Required:
    - default_action
    - signalr_service_id
    - public_network
Optional:
    - private_endpoint
EOT

  type = map(object({
    default_action     = string
    signalr_service_id = string
    private_endpoint   = optional(set(object({
            allowed_request_types = optional(set(string))
            denied_request_types  = optional(set(string))
        })))
    public_network     = list(object({
            allowed_request_types = optional(set(string))
            denied_request_types  = optional(set(string))
        }))
  }))
}
