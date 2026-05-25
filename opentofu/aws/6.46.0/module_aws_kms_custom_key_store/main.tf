resource "aws_kms_custom_key_store" "kms_custom_key_stores" {
  for_each = var.kms_custom_key_stores

  custom_key_store_name               = each.value.custom_key_store_name
  cloud_hsm_cluster_id                = each.value.cloud_hsm_cluster_id
  custom_key_store_type               = each.value.custom_key_store_type
  key_store_password                  = each.value.key_store_password
  region                              = each.value.region
  trust_anchor_certificate            = each.value.trust_anchor_certificate
  xks_proxy_connectivity              = each.value.xks_proxy_connectivity
  xks_proxy_uri_endpoint              = each.value.xks_proxy_uri_endpoint
  xks_proxy_uri_path                  = each.value.xks_proxy_uri_path
  xks_proxy_vpc_endpoint_service_name = each.value.xks_proxy_vpc_endpoint_service_name

  dynamic "xks_proxy_authentication_credential" {
    for_each = each.value.xks_proxy_authentication_credential != null ? each.value.xks_proxy_authentication_credential : []
    content {
      access_key_id         = xks_proxy_authentication_credential.value.access_key_id
      raw_secret_access_key = xks_proxy_authentication_credential.value.raw_secret_access_key
    }
  }
}
