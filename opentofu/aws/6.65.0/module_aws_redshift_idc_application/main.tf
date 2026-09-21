resource "aws_redshift_idc_application" "redshift_idc_applications" {
  for_each = var.redshift_idc_applications

  iam_role_arn                  = each.value.iam_role_arn
  idc_display_name              = each.value.idc_display_name
  idc_instance_arn              = each.value.idc_instance_arn
  redshift_idc_application_name = each.value.redshift_idc_application_name
  application_type              = each.value.application_type
  identity_namespace            = each.value.identity_namespace
  region                        = each.value.region
  tags                          = each.value.tags

  dynamic "authorized_token_issuer" {
    for_each = each.value.authorized_token_issuer != null ? each.value.authorized_token_issuer : []
    content {
      authorized_audiences_list = authorized_token_issuer.value.authorized_audiences_list
      trusted_token_issuer_arn  = authorized_token_issuer.value.trusted_token_issuer_arn
    }
  }

  dynamic "service_integration" {
    for_each = each.value.service_integration != null ? each.value.service_integration : []
    content {

      dynamic "lake_formation" {
        for_each = service_integration.value.lake_formation != null ? service_integration.value.lake_formation : []
        content {

          dynamic "lake_formation_query" {
            for_each = lake_formation.value.lake_formation_query != null ? lake_formation.value.lake_formation_query : []
            content {
              authorization = lake_formation_query.value.authorization
            }
          }
        }
      }

      dynamic "redshift" {
        for_each = service_integration.value.redshift != null ? service_integration.value.redshift : []
        content {

          dynamic "connect" {
            for_each = redshift.value.connect != null ? redshift.value.connect : []
            content {
              authorization = connect.value.authorization
            }
          }
        }
      }

      dynamic "s3_access_grants" {
        for_each = service_integration.value.s3_access_grants != null ? service_integration.value.s3_access_grants : []
        content {

          dynamic "read_write_access" {
            for_each = s3_access_grants.value.read_write_access != null ? s3_access_grants.value.read_write_access : []
            content {
              authorization = read_write_access.value.authorization
            }
          }
        }
      }
    }
  }
}
