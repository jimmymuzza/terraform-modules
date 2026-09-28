resource "aws_dataexchange_revision_assets" "dataexchange_revision_assets" {
  for_each = var.dataexchange_revision_assets

  data_set_id   = each.value.data_set_id
  comment       = each.value.comment
  finalized     = each.value.finalized
  force_destroy = each.value.force_destroy
  region        = each.value.region
  tags          = each.value.tags

  dynamic "asset" {
    for_each = each.value.asset != null ? each.value.asset : []
    content {

      dynamic "create_s3_data_access_from_s3_bucket" {
        for_each = asset.value.create_s3_data_access_from_s3_bucket != null ? asset.value.create_s3_data_access_from_s3_bucket : []
        content {

          dynamic "asset_source" {
            for_each = create_s3_data_access_from_s3_bucket.value.asset_source != null ? create_s3_data_access_from_s3_bucket.value.asset_source : []
            content {
              bucket       = asset_source.value.bucket
              key_prefixes = asset_source.value.key_prefixes
              keys         = asset_source.value.keys

              dynamic "kms_keys_to_grant" {
                for_each = asset_source.value.kms_keys_to_grant != null ? asset_source.value.kms_keys_to_grant : []
                content {
                  kms_key_arn = kms_keys_to_grant.value.kms_key_arn
                }
              }
            }
          }
        }
      }

      dynamic "import_assets_from_s3" {
        for_each = asset.value.import_assets_from_s3 != null ? asset.value.import_assets_from_s3 : []
        content {

          dynamic "asset_source" {
            for_each = import_assets_from_s3.value.asset_source != null ? import_assets_from_s3.value.asset_source : []
            content {
              bucket = asset_source.value.bucket
              key    = asset_source.value.key
            }
          }
        }
      }

      dynamic "import_assets_from_signed_url" {
        for_each = asset.value.import_assets_from_signed_url != null ? asset.value.import_assets_from_signed_url : []
        content {
          filename = import_assets_from_signed_url.value.filename
        }
      }
    }
  }
}
