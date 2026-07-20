resource "aws_sagemaker_code_repository" "sagemaker_code_repositories" {
  for_each = var.sagemaker_code_repositories

  code_repository_name = each.value.code_repository_name
  region               = each.value.region
  tags                 = each.value.tags
  tags_all             = each.value.tags_all

  dynamic "git_config" {
    for_each = each.value.git_config != null ? each.value.git_config : []
    content {
      repository_url = git_config.value.repository_url
      branch         = git_config.value.branch
      secret_arn     = git_config.value.secret_arn
    }
  }
}
