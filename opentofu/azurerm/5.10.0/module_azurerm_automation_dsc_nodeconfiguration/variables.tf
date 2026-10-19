variable "automation_dsc_nodeconfigurations" {
  description = <<EOT
Map of automation_dsc_nodeconfigurations, attributes below
Required:
    - automation_account_name
    - content_embedded
    - name
    - resource_group_name
EOT

  type = map(object({
    automation_account_name = string
    content_embedded        = string
    name                    = string
    resource_group_name     = string
  }))
}
