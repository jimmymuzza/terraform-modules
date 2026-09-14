variable "s3_bucket_notifications" {
  description = <<EOT
Map of s3_bucket_notifications, attributes below
Required:
    - bucket
Optional:
    - eventbridge
    - region
    - lambda_function
    - queue
    - topic
EOT

  type = map(object({
    bucket          = string
    eventbridge     = optional(bool)
    region          = optional(string)
    lambda_function = optional(list(object({
            events              = set(string)
            filter_prefix       = optional(string)
            filter_suffix       = optional(string)
            lambda_function_arn = optional(string)
        })))
    queue           = optional(list(object({
            events        = set(string)
            queue_arn     = string
            filter_prefix = optional(string)
            filter_suffix = optional(string)
        })))
    topic           = optional(list(object({
            events        = set(string)
            topic_arn     = string
            filter_prefix = optional(string)
            filter_suffix = optional(string)
        })))
  }))
}
