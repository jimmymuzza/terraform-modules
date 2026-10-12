variable "kubernetes_cluster_extensions" {
  description = <<EOT
Map of kubernetes_cluster_extensions, attributes below
Required:
    - cluster_id
    - extension_type
    - name
Optional:
    - configuration_protected_settings
    - configuration_settings
    - release_namespace
    - release_train
    - target_namespace
    - version
    - plan
EOT

  type = map(object({
    cluster_id                       = string
    extension_type                   = string
    name                             = string
    configuration_protected_settings = optional(map(string))
    configuration_settings           = optional(map(string))
    release_namespace                = optional(string)
    release_train                    = optional(string)
    target_namespace                 = optional(string)
    version                          = optional(string)
    plan                             = optional(list(object({
            name           = string
            product        = string
            publisher      = string
            promotion_code = optional(string)
            version        = optional(string)
        })))
  }))
}
