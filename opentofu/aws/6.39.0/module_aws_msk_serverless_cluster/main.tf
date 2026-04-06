resource "aws_msk_serverless_cluster" "msk_serverless_clusters" {
  for_each = var.msk_serverless_clusters

  cluster_name = each.value.cluster_name
  region       = each.value.region
  tags         = each.value.tags
  tags_all     = each.value.tags_all

  dynamic "client_authentication" {
    for_each = each.value.client_authentication != null ? each.value.client_authentication : []
    content {

      dynamic "sasl" {
        for_each = client_authentication.value.sasl != null ? client_authentication.value.sasl : []
        content {

          dynamic "iam" {
            for_each = sasl.value.iam != null ? sasl.value.iam : []
            content {
              enabled = iam.value.enabled
            }
          }
        }
      }
    }
  }

  dynamic "vpc_config" {
    for_each = each.value.vpc_config != null ? each.value.vpc_config : []
    content {
      subnet_ids         = vpc_config.value.subnet_ids
      security_group_ids = vpc_config.value.security_group_ids
    }
  }
}
