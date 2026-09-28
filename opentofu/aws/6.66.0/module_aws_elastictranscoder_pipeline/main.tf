resource "aws_elastictranscoder_pipeline" "elastictranscoder_pipelines" {
  for_each = var.elastictranscoder_pipelines

  input_bucket    = each.value.input_bucket
  role            = each.value.role
  aws_kms_key_arn = each.value.aws_kms_key_arn
  name            = each.value.name
  output_bucket   = each.value.output_bucket
  region          = each.value.region

  dynamic "content_config" {
    for_each = each.value.content_config != null ? each.value.content_config : []
    content {
      bucket        = content_config.value.bucket
      storage_class = content_config.value.storage_class
    }
  }

  dynamic "content_config_permissions" {
    for_each = each.value.content_config_permissions != null ? each.value.content_config_permissions : []
    content {
      access       = content_config_permissions.value.access
      grantee      = content_config_permissions.value.grantee
      grantee_type = content_config_permissions.value.grantee_type
    }
  }

  dynamic "notifications" {
    for_each = each.value.notifications != null ? each.value.notifications : []
    content {
      completed   = notifications.value.completed
      error       = notifications.value.error
      progressing = notifications.value.progressing
      warning     = notifications.value.warning
    }
  }

  dynamic "thumbnail_config" {
    for_each = each.value.thumbnail_config != null ? each.value.thumbnail_config : []
    content {
      bucket        = thumbnail_config.value.bucket
      storage_class = thumbnail_config.value.storage_class
    }
  }

  dynamic "thumbnail_config_permissions" {
    for_each = each.value.thumbnail_config_permissions != null ? each.value.thumbnail_config_permissions : []
    content {
      access       = thumbnail_config_permissions.value.access
      grantee      = thumbnail_config_permissions.value.grantee
      grantee_type = thumbnail_config_permissions.value.grantee_type
    }
  }
}
