variable "kms_custom_key_stores" {
  description = <<EOT
Map of kms_custom_key_stores, attributes below
Required:
    - custom_key_store_name
Optional:
    - cloud_hsm_cluster_id
    - custom_key_store_type
    - key_store_password
    - region
    - trust_anchor_certificate
    - xks_proxy_connectivity
    - xks_proxy_uri_endpoint
    - xks_proxy_uri_path
    - xks_proxy_vpc_endpoint_service_name
    - xks_proxy_authentication_credential
EOT

  type = map(object({
    custom_key_store_name               = string
    cloud_hsm_cluster_id                = optional(string)
    custom_key_store_type               = optional(string)
    key_store_password                  = optional(string)
    region                              = optional(string)
    trust_anchor_certificate            = optional(string)
    xks_proxy_connectivity              = optional(string)
    xks_proxy_uri_endpoint              = optional(string)
    xks_proxy_uri_path                  = optional(string)
    xks_proxy_vpc_endpoint_service_name = optional(string)
    xks_proxy_authentication_credential = optional(list(object({
            access_key_id         = string
            raw_secret_access_key = string
        })))
  }))
}
