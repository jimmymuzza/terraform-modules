resource "aws_devicefarm_project" "devicefarm_projects" {
  for_each = var.devicefarm_projects

  name                        = each.value.name
  default_job_timeout_minutes = each.value.default_job_timeout_minutes
  region                      = each.value.region
  tags                        = each.value.tags
  tags_all                    = each.value.tags_all
}
