resource "aws_codeartifact_domain" "codeartifact_domains" {
  for_each = var.codeartifact_domains

  domain         = each.value.domain
  encryption_key = each.value.encryption_key
  region         = each.value.region
  tags           = each.value.tags
  tags_all       = each.value.tags_all
}
