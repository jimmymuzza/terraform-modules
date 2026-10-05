variable "arc_kubernetes_cluster_extensions" {
  description = <<EOT
Map of arc_kubernetes_cluster_extensions, attributes below
Required:
    - cluster_id
    - extension_type
    - name
    - identity
Optional:
    - configuration_protected_settings
    - configuration_settings
    - release_namespace
    - release_train
    - target_namespace
    - version
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
    identity                         = list(object({
            type = string
        }))
  }))
}
