resource "aws_sagemaker_workteam" "sagemaker_workteams" {
  for_each = var.sagemaker_workteams

  description    = each.value.description
  workteam_name  = each.value.workteam_name
  region         = each.value.region
  tags           = each.value.tags
  tags_all       = each.value.tags_all
  workforce_name = each.value.workforce_name

  dynamic "member_definition" {
    for_each = each.value.member_definition != null ? each.value.member_definition : []
    content {

      dynamic "cognito_member_definition" {
        for_each = member_definition.value.cognito_member_definition != null ? member_definition.value.cognito_member_definition : []
        content {
          client_id  = cognito_member_definition.value.client_id
          user_group = cognito_member_definition.value.user_group
          user_pool  = cognito_member_definition.value.user_pool
        }
      }

      dynamic "oidc_member_definition" {
        for_each = member_definition.value.oidc_member_definition != null ? member_definition.value.oidc_member_definition : []
        content {
          groups = oidc_member_definition.value.groups
        }
      }
    }
  }

  dynamic "notification_configuration" {
    for_each = each.value.notification_configuration != null ? each.value.notification_configuration : []
    content {
      notification_topic_arn = notification_configuration.value.notification_topic_arn
    }
  }

  dynamic "worker_access_configuration" {
    for_each = each.value.worker_access_configuration != null ? each.value.worker_access_configuration : []
    content {

      dynamic "s3_presign" {
        for_each = worker_access_configuration.value.s3_presign != null ? worker_access_configuration.value.s3_presign : []
        content {

          dynamic "iam_policy_constraints" {
            for_each = s3_presign.value.iam_policy_constraints != null ? s3_presign.value.iam_policy_constraints : []
            content {
              source_ip     = iam_policy_constraints.value.source_ip
              vpc_source_ip = iam_policy_constraints.value.vpc_source_ip
            }
          }
        }
      }
    }
  }
}
