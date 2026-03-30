resource "aws_iam_openid_connect_provider" "iam_openid_connect_providers" {
  for_each = var.iam_openid_connect_providers

  client_id_list  = each.value.client_id_list
  url             = each.value.url
  tags            = each.value.tags
  tags_all        = each.value.tags_all
  thumbprint_list = each.value.thumbprint_list
}
