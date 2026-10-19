resource "aws_quicksight_custom_permissions" "quicksight_custom_permissions" {
  for_each = var.quicksight_custom_permissions

  custom_permissions_name = each.value.custom_permissions_name
  aws_account_id          = each.value.aws_account_id
  region                  = each.value.region
  tags                    = each.value.tags

  dynamic "capabilities" {
    for_each = each.value.capabilities != null ? each.value.capabilities : []
    content {
      action                                     = capabilities.value.action
      add_or_run_anomaly_detection_for_analyses  = capabilities.value.add_or_run_anomaly_detection_for_analyses
      analysis                                   = capabilities.value.analysis
      automate                                   = capabilities.value.automate
      chat_agent                                 = capabilities.value.chat_agent
      create_and_update_dashboard_email_reports  = capabilities.value.create_and_update_dashboard_email_reports
      create_and_update_data_sources             = capabilities.value.create_and_update_data_sources
      create_and_update_datasets                 = capabilities.value.create_and_update_datasets
      create_and_update_themes                   = capabilities.value.create_and_update_themes
      create_and_update_threshold_alerts         = capabilities.value.create_and_update_threshold_alerts
      create_chat_agents                         = capabilities.value.create_chat_agents
      create_shared_folders                      = capabilities.value.create_shared_folders
      create_spice_dataset                       = capabilities.value.create_spice_dataset
      dashboard                                  = capabilities.value.dashboard
      export_to_csv                              = capabilities.value.export_to_csv
      export_to_csv_in_scheduled_reports         = capabilities.value.export_to_csv_in_scheduled_reports
      export_to_excel                            = capabilities.value.export_to_excel
      export_to_excel_in_scheduled_reports       = capabilities.value.export_to_excel_in_scheduled_reports
      export_to_pdf                              = capabilities.value.export_to_pdf
      export_to_pdf_in_scheduled_reports         = capabilities.value.export_to_pdf_in_scheduled_reports
      flow                                       = capabilities.value.flow
      include_content_in_scheduled_reports_email = capabilities.value.include_content_in_scheduled_reports_email
      knowledge_base                             = capabilities.value.knowledge_base
      perform_flow_ui_task                       = capabilities.value.perform_flow_ui_task
      print_reports                              = capabilities.value.print_reports
      publish_without_approval                   = capabilities.value.publish_without_approval
      rename_shared_folders                      = capabilities.value.rename_shared_folders
      research                                   = capabilities.value.research
      share_analyses                             = capabilities.value.share_analyses
      share_dashboards                           = capabilities.value.share_dashboards
      share_data_sources                         = capabilities.value.share_data_sources
      share_datasets                             = capabilities.value.share_datasets
      space                                      = capabilities.value.space
      subscribe_dashboard_email_reports          = capabilities.value.subscribe_dashboard_email_reports
      use_agent_web_search                       = capabilities.value.use_agent_web_search
      use_bedrock_models                         = capabilities.value.use_bedrock_models
      view_account_spice_capacity                = capabilities.value.view_account_spice_capacity
    }
  }
}
