variable "sagemaker_human_task_uis" {
  description = <<EOT
Map of sagemaker_human_task_uis, attributes below
Required:
    - human_task_ui_name
    - ui_template
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    human_task_ui_name = string
    region             = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
    ui_template        = list(object({
            content = optional(string)
        }))
  }))
}
