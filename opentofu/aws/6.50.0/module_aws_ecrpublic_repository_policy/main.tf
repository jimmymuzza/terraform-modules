resource "aws_ecrpublic_repository_policy" "ecrpublic_repository_policies" {
  for_each = var.ecrpublic_repository_policies

  policy          = each.value.policy
  repository_name = each.value.repository_name
  region          = each.value.region
}
