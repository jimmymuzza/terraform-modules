resource "aws_s3_bucket_notification" "s3_bucket_notifications" {
  for_each = var.s3_bucket_notifications

  bucket      = each.value.bucket
  eventbridge = each.value.eventbridge
  region      = each.value.region

  dynamic "lambda_function" {
    for_each = each.value.lambda_function != null ? each.value.lambda_function : []
    content {
      events              = lambda_function.value.events
      filter_prefix       = lambda_function.value.filter_prefix
      filter_suffix       = lambda_function.value.filter_suffix
      lambda_function_arn = lambda_function.value.lambda_function_arn
    }
  }

  dynamic "queue" {
    for_each = each.value.queue != null ? each.value.queue : []
    content {
      events        = queue.value.events
      queue_arn     = queue.value.queue_arn
      filter_prefix = queue.value.filter_prefix
      filter_suffix = queue.value.filter_suffix
    }
  }

  dynamic "topic" {
    for_each = each.value.topic != null ? each.value.topic : []
    content {
      events        = topic.value.events
      topic_arn     = topic.value.topic_arn
      filter_prefix = topic.value.filter_prefix
      filter_suffix = topic.value.filter_suffix
    }
  }
}
