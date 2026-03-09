resource "aws_codeartifact_repository" "codeartifact_repositories" {
  for_each = var.codeartifact_repositories

  domain       = each.value.domain
  repository   = each.value.repository
  description  = each.value.description
  domain_owner = each.value.domain_owner
  region       = each.value.region
  tags         = each.value.tags
  tags_all     = each.value.tags_all

  dynamic "external_connections" {
    for_each = each.value.external_connections != null ? each.value.external_connections : []
    content {
      external_connection_name = external_connections.value.external_connection_name
    }
  }

  dynamic "upstream" {
    for_each = each.value.upstream != null ? each.value.upstream : []
    content {
      repository_name = upstream.value.repository_name
    }
  }
}
