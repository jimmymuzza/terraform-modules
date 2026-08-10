resource "aws_prometheus_scraper" "prometheus_scrapers" {
  for_each = var.prometheus_scrapers

  scrape_configuration = each.value.scrape_configuration
  alias                = each.value.alias
  region               = each.value.region
  tags                 = each.value.tags

  dynamic "destination" {
    for_each = each.value.destination != null ? each.value.destination : []
    content {

      dynamic "amp" {
        for_each = destination.value.amp != null ? destination.value.amp : []
        content {
          workspace_arn = amp.value.workspace_arn
        }
      }

      dynamic "cloudwatch" {
        for_each = destination.value.cloudwatch != null ? destination.value.cloudwatch : []
        content {
          dataset_arn = cloudwatch.value.dataset_arn
        }
      }
    }
  }

  dynamic "role_configuration" {
    for_each = each.value.role_configuration != null ? each.value.role_configuration : []
    content {
      source_role_arn = role_configuration.value.source_role_arn
      target_role_arn = role_configuration.value.target_role_arn
    }
  }

  dynamic "source" {
    for_each = each.value.source != null ? each.value.source : []
    content {

      dynamic "eks" {
        for_each = source.value.eks != null ? source.value.eks : []
        content {
          cluster_arn        = eks.value.cluster_arn
          subnet_ids         = eks.value.subnet_ids
          security_group_ids = eks.value.security_group_ids
        }
      }

      dynamic "vpc" {
        for_each = source.value.vpc != null ? source.value.vpc : []
        content {
          security_group_ids = vpc.value.security_group_ids
          subnet_ids         = vpc.value.subnet_ids
        }
      }
    }
  }
}
