resource "azurerm_vpn_server_configuration" "vpn_server_configurations" {
  for_each = var.vpn_server_configurations

  location                 = each.value.location
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  vpn_authentication_types = each.value.vpn_authentication_types
  tags                     = each.value.tags
  vpn_protocols            = each.value.vpn_protocols

  dynamic "azure_active_directory_authentication" {
    for_each = each.value.azure_active_directory_authentication != null ? each.value.azure_active_directory_authentication : []
    content {
      audience = azure_active_directory_authentication.value.audience
      issuer   = azure_active_directory_authentication.value.issuer
      tenant   = azure_active_directory_authentication.value.tenant
    }
  }

  dynamic "client_revoked_certificate" {
    for_each = each.value.client_revoked_certificate != null ? each.value.client_revoked_certificate : []
    content {
      name       = client_revoked_certificate.value.name
      thumbprint = client_revoked_certificate.value.thumbprint
    }
  }

  dynamic "client_root_certificate" {
    for_each = each.value.client_root_certificate != null ? each.value.client_root_certificate : []
    content {
      name             = client_root_certificate.value.name
      public_cert_data = client_root_certificate.value.public_cert_data
    }
  }

  dynamic "ipsec_policy" {
    for_each = each.value.ipsec_policy != null ? each.value.ipsec_policy : []
    content {
      dh_group               = ipsec_policy.value.dh_group
      ike_encryption         = ipsec_policy.value.ike_encryption
      ike_integrity          = ipsec_policy.value.ike_integrity
      ipsec_encryption       = ipsec_policy.value.ipsec_encryption
      ipsec_integrity        = ipsec_policy.value.ipsec_integrity
      pfs_group              = ipsec_policy.value.pfs_group
      sa_data_size_kilobytes = ipsec_policy.value.sa_data_size_kilobytes
      sa_lifetime_seconds    = ipsec_policy.value.sa_lifetime_seconds
    }
  }

  dynamic "radius" {
    for_each = each.value.radius != null ? each.value.radius : []
    content {

      dynamic "client_root_certificate" {
        for_each = radius.value.client_root_certificate != null ? radius.value.client_root_certificate : []
        content {
          name       = client_root_certificate.value.name
          thumbprint = client_root_certificate.value.thumbprint
        }
      }

      dynamic "server" {
        for_each = radius.value.server != null ? radius.value.server : []
        content {
          address = server.value.address
          score   = server.value.score
          secret  = server.value.secret
        }
      }

      dynamic "server_root_certificate" {
        for_each = radius.value.server_root_certificate != null ? radius.value.server_root_certificate : []
        content {
          name             = server_root_certificate.value.name
          public_cert_data = server_root_certificate.value.public_cert_data
        }
      }
    }
  }
}
