variable "sqs_queue_redrive_policies" {
  description = <<EOT
Map of sqs_queue_redrive_policies, attributes below
Required:
    - queue_url
    - redrive_policy
Optional:
    - region
EOT

  type = map(object({
    queue_url      = string
    redrive_policy = string
    region         = optional(string)
  }))
}
