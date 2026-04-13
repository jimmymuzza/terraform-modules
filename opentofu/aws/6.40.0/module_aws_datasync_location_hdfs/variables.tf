variable "datasync_location_hdfs" {
  description = <<EOT
Map of datasync_location_hdfs, attributes below
Required:
    - agent_arns
    - name_node
Optional:
    - authentication_type
    - block_size
    - kerberos_keytab
    - kerberos_keytab_base64
    - kerberos_krb5_conf
    - kerberos_krb5_conf_base64
    - kerberos_principal
    - kms_key_provider_uri
    - region
    - replication_factor
    - simple_user
    - subdirectory
    - tags
    - tags_all
    - qop_configuration
EOT

  type = map(object({
    agent_arns                = set(string)
    authentication_type       = optional(string)
    block_size                = optional(number)
    kerberos_keytab           = optional(string)
    kerberos_keytab_base64    = optional(string)
    kerberos_krb5_conf        = optional(string)
    kerberos_krb5_conf_base64 = optional(string)
    kerberos_principal        = optional(string)
    kms_key_provider_uri      = optional(string)
    region                    = optional(string)
    replication_factor        = optional(number)
    simple_user               = optional(string)
    subdirectory              = optional(string)
    tags                      = optional(map(string))
    tags_all                  = optional(map(string))
    name_node                 = set(object({
            hostname = string
            port     = number
        }))
    qop_configuration         = optional(list(object({
            data_transfer_protection = optional(string)
            rpc_protection           = optional(string)
        })))
  }))
}
