resource "aws_elastic_beanstalk_application" "elastic_beanstalk_applications" {
  for_each = var.elastic_beanstalk_applications

  name        = each.value.name
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "appversion_lifecycle" {
    for_each = each.value.appversion_lifecycle != null ? each.value.appversion_lifecycle : []
    content {
      service_role          = appversion_lifecycle.value.service_role
      delete_source_from_s3 = appversion_lifecycle.value.delete_source_from_s3
      max_age_in_days       = appversion_lifecycle.value.max_age_in_days
      max_count             = appversion_lifecycle.value.max_count
    }
  }
}
