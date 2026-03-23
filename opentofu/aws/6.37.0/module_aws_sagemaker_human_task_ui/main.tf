resource "aws_sagemaker_human_task_ui" "sagemaker_human_task_uis" {
  for_each = var.sagemaker_human_task_uis

  human_task_ui_name = each.value.human_task_ui_name
  region             = each.value.region
  tags               = each.value.tags
  tags_all           = each.value.tags_all

  dynamic "ui_template" {
    for_each = each.value.ui_template != null ? each.value.ui_template : []
    content {
      content = ui_template.value.content
    }
  }
}
