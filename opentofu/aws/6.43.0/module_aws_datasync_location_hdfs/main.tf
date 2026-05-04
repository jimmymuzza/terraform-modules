resource "aws_datasync_location_hdfs" "datasync_location_hdfs" {
  for_each = var.datasync_location_hdfs

  agent_arns                = each.value.agent_arns
  authentication_type       = each.value.authentication_type
  block_size                = each.value.block_size
  kerberos_keytab           = each.value.kerberos_keytab
  kerberos_keytab_base64    = each.value.kerberos_keytab_base64
  kerberos_krb5_conf        = each.value.kerberos_krb5_conf
  kerberos_krb5_conf_base64 = each.value.kerberos_krb5_conf_base64
  kerberos_principal        = each.value.kerberos_principal
  kms_key_provider_uri      = each.value.kms_key_provider_uri
  region                    = each.value.region
  replication_factor        = each.value.replication_factor
  simple_user               = each.value.simple_user
  subdirectory              = each.value.subdirectory
  tags                      = each.value.tags
  tags_all                  = each.value.tags_all

  dynamic "name_node" {
    for_each = each.value.name_node != null ? each.value.name_node : []
    content {
      hostname = name_node.value.hostname
      port     = name_node.value.port
    }
  }

  dynamic "qop_configuration" {
    for_each = each.value.qop_configuration != null ? each.value.qop_configuration : []
    content {
      data_transfer_protection = qop_configuration.value.data_transfer_protection
      rpc_protection           = qop_configuration.value.rpc_protection
    }
  }
}
