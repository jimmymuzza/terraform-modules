resource "aws_storagegateway_smb_file_share" "storagegateway_smb_file_shares" {
  for_each = var.storagegateway_smb_file_shares

  gateway_arn              = each.value.gateway_arn
  location_arn             = each.value.location_arn
  role_arn                 = each.value.role_arn
  access_based_enumeration = each.value.access_based_enumeration
  admin_user_list          = each.value.admin_user_list
  audit_destination_arn    = each.value.audit_destination_arn
  authentication           = each.value.authentication
  bucket_region            = each.value.bucket_region
  case_sensitivity         = each.value.case_sensitivity
  default_storage_class    = each.value.default_storage_class
  file_share_name          = each.value.file_share_name
  guess_mime_type_enabled  = each.value.guess_mime_type_enabled
  invalid_user_list        = each.value.invalid_user_list
  kms_encrypted            = each.value.kms_encrypted
  kms_key_arn              = each.value.kms_key_arn
  notification_policy      = each.value.notification_policy
  object_acl               = each.value.object_acl
  oplocks_enabled          = each.value.oplocks_enabled
  read_only                = each.value.read_only
  region                   = each.value.region
  requester_pays           = each.value.requester_pays
  smb_acl_enabled          = each.value.smb_acl_enabled
  tags                     = each.value.tags
  tags_all                 = each.value.tags_all
  valid_user_list          = each.value.valid_user_list
  vpc_endpoint_dns_name    = each.value.vpc_endpoint_dns_name

  dynamic "cache_attributes" {
    for_each = each.value.cache_attributes != null ? each.value.cache_attributes : []
    content {
      cache_stale_timeout_in_seconds = cache_attributes.value.cache_stale_timeout_in_seconds
    }
  }
}
