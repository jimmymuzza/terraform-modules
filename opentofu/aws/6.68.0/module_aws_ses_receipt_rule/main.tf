resource "aws_ses_receipt_rule" "ses_receipt_rules" {
  for_each = var.ses_receipt_rules

  name          = each.value.name
  rule_set_name = each.value.rule_set_name
  after         = each.value.after
  enabled       = each.value.enabled
  recipients    = each.value.recipients
  region        = each.value.region
  scan_enabled  = each.value.scan_enabled
  tls_policy    = each.value.tls_policy

  dynamic "add_header_action" {
    for_each = each.value.add_header_action != null ? each.value.add_header_action : []
    content {
      header_name  = add_header_action.value.header_name
      header_value = add_header_action.value.header_value
      position     = add_header_action.value.position
    }
  }

  dynamic "bounce_action" {
    for_each = each.value.bounce_action != null ? each.value.bounce_action : []
    content {
      message         = bounce_action.value.message
      position        = bounce_action.value.position
      sender          = bounce_action.value.sender
      smtp_reply_code = bounce_action.value.smtp_reply_code
      status_code     = bounce_action.value.status_code
      topic_arn       = bounce_action.value.topic_arn
    }
  }

  dynamic "lambda_action" {
    for_each = each.value.lambda_action != null ? each.value.lambda_action : []
    content {
      function_arn    = lambda_action.value.function_arn
      position        = lambda_action.value.position
      invocation_type = lambda_action.value.invocation_type
      topic_arn       = lambda_action.value.topic_arn
    }
  }

  dynamic "s3_action" {
    for_each = each.value.s3_action != null ? each.value.s3_action : []
    content {
      bucket_name       = s3_action.value.bucket_name
      position          = s3_action.value.position
      iam_role_arn      = s3_action.value.iam_role_arn
      kms_key_arn       = s3_action.value.kms_key_arn
      object_key_prefix = s3_action.value.object_key_prefix
      topic_arn         = s3_action.value.topic_arn
    }
  }

  dynamic "sns_action" {
    for_each = each.value.sns_action != null ? each.value.sns_action : []
    content {
      position  = sns_action.value.position
      topic_arn = sns_action.value.topic_arn
      encoding  = sns_action.value.encoding
    }
  }

  dynamic "stop_action" {
    for_each = each.value.stop_action != null ? each.value.stop_action : []
    content {
      position  = stop_action.value.position
      scope     = stop_action.value.scope
      topic_arn = stop_action.value.topic_arn
    }
  }

  dynamic "workmail_action" {
    for_each = each.value.workmail_action != null ? each.value.workmail_action : []
    content {
      organization_arn = workmail_action.value.organization_arn
      position         = workmail_action.value.position
      topic_arn        = workmail_action.value.topic_arn
    }
  }
}
