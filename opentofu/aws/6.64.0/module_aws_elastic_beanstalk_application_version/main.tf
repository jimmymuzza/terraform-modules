resource "aws_elastic_beanstalk_application_version" "elastic_beanstalk_application_versions" {
  for_each = var.elastic_beanstalk_application_versions

  application  = each.value.application
  bucket       = each.value.bucket
  key          = each.value.key
  name         = each.value.name
  description  = each.value.description
  force_delete = each.value.force_delete
  process      = each.value.process
  region       = each.value.region
  tags         = each.value.tags
  tags_all     = each.value.tags_all
}
