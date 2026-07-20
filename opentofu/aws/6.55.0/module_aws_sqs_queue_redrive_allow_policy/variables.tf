variable "sqs_queue_redrive_allow_policies" {
  description = <<EOT
Map of sqs_queue_redrive_allow_policies, attributes below
Required:
    - queue_url
    - redrive_allow_policy
Optional:
    - region
EOT

  type = map(object({
    queue_url            = string
    redrive_allow_policy = string
    region               = optional(string)
  }))
}
