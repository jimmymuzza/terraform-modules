variable "kubernetes_flux_configurations" {
  description = <<EOT
Map of kubernetes_flux_configurations, attributes below
Required:
    - cluster_id
    - name
    - namespace
    - kustomizations
Optional:
    - continuous_reconciliation_enabled
    - scope
    - blob_storage
    - bucket
    - git_repository
EOT

  type = map(object({
    cluster_id                        = string
    name                              = string
    namespace                         = string
    continuous_reconciliation_enabled = optional(bool)
    scope                             = optional(string)
    blob_storage                      = optional(list(object({
            container_id             = string
            account_key              = optional(string)
            local_auth_reference     = optional(string)
            sas_token                = optional(string)
            sync_interval_in_seconds = optional(number)
            timeout_in_seconds       = optional(number)
            managed_identity         = optional(list(object({
                client_id = string
            })))
            service_principal        = optional(list(object({
                client_id                     = string
                tenant_id                     = string
                client_certificate_base64     = optional(string)
                client_certificate_password   = optional(string)
                client_certificate_send_chain = optional(bool)
                client_secret                 = optional(string)
            })))
        })))
    bucket                            = optional(list(object({
            bucket_name              = string
            url                      = string
            access_key               = optional(string)
            local_auth_reference     = optional(string)
            secret_key_base64        = optional(string)
            sync_interval_in_seconds = optional(number)
            timeout_in_seconds       = optional(number)
            tls_enabled              = optional(bool)
        })))
    git_repository                    = optional(list(object({
            reference_type           = string
            reference_value          = string
            url                      = string
            https_ca_cert_base64     = optional(string)
            https_key_base64         = optional(string)
            https_user               = optional(string)
            local_auth_reference     = optional(string)
            provider                 = optional(string)
            ssh_known_hosts_base64   = optional(string)
            ssh_private_key_base64   = optional(string)
            sync_interval_in_seconds = optional(number)
            timeout_in_seconds       = optional(number)
        })))
    kustomizations                    = set(object({
            name                       = string
            depends_on                 = optional(list(string))
            garbage_collection_enabled = optional(bool)
            path                       = optional(string)
            recreating_enabled         = optional(bool)
            retry_interval_in_seconds  = optional(number)
            sync_interval_in_seconds   = optional(number)
            timeout_in_seconds         = optional(number)
            wait                       = optional(bool)
            post_build                 = optional(list(object({
                substitute      = optional(map(string))
                substitute_from = optional(list(object({
                    kind     = string
                    name     = string
                    optional = optional(bool)
                })))
            })))
        }))
  }))
}
