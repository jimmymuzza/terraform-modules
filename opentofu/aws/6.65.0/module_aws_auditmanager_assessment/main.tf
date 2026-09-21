resource "aws_auditmanager_assessment" "auditmanager_assessments" {
  for_each = var.auditmanager_assessments

  framework_id = each.value.framework_id
  name         = each.value.name
  description  = each.value.description
  region       = each.value.region
  tags         = each.value.tags

  dynamic "assessment_reports_destination" {
    for_each = each.value.assessment_reports_destination != null ? each.value.assessment_reports_destination : []
    content {
      destination      = assessment_reports_destination.value.destination
      destination_type = assessment_reports_destination.value.destination_type
    }
  }

  dynamic "roles" {
    for_each = each.value.roles != null ? each.value.roles : []
    content {
      role_arn  = roles.value.role_arn
      role_type = roles.value.role_type
    }
  }

  dynamic "scope" {
    for_each = each.value.scope != null ? each.value.scope : []
    content {

      dynamic "aws_accounts" {
        for_each = scope.value.aws_accounts != null ? scope.value.aws_accounts : []
        content {
        }
      }

      dynamic "aws_services" {
        for_each = scope.value.aws_services != null ? scope.value.aws_services : []
        content {
          service_name = aws_services.value.service_name
        }
      }
    }
  }
}
