variable "quicksight_account_subscriptions" {
  description = <<EOT
Map of quicksight_account_subscriptions, attributes below
Required:
    - account_name
    - authentication_method
    - edition
    - notification_email
Optional:
    - active_directory_name
    - admin_group
    - admin_pro_group
    - author_group
    - author_pro_group
    - aws_account_id
    - contact_number
    - directory_id
    - email_address
    - first_name
    - iam_identity_center_instance_arn
    - last_name
    - reader_group
    - reader_pro_group
    - realm
    - region
EOT

  type = map(object({
    account_name                     = string
    authentication_method            = string
    edition                          = string
    notification_email               = string
    active_directory_name            = optional(string)
    admin_group                      = optional(list(string))
    admin_pro_group                  = optional(list(string))
    author_group                     = optional(list(string))
    author_pro_group                 = optional(list(string))
    aws_account_id                   = optional(string)
    contact_number                   = optional(string)
    directory_id                     = optional(string)
    email_address                    = optional(string)
    first_name                       = optional(string)
    iam_identity_center_instance_arn = optional(string)
    last_name                        = optional(string)
    reader_group                     = optional(list(string))
    reader_pro_group                 = optional(list(string))
    realm                            = optional(string)
    region                           = optional(string)
  }))
}
