resource "aws_quicksight_custom_permissions" "quicksight_custom_permissions" {
  for_each = var.quicksight_custom_permissions

  custom_permissions_name = each.value.custom_permissions_name
  aws_account_id          = each.value.aws_account_id
  region                  = each.value.region
  tags                    = each.value.tags

  dynamic "capabilities" {
    for_each = each.value.capabilities != null ? each.value.capabilities : []
    content {
      add_or_run_anomaly_detection_for_analyses  = capabilities.value.add_or_run_anomaly_detection_for_analyses
      create_and_update_dashboard_email_reports  = capabilities.value.create_and_update_dashboard_email_reports
      create_and_update_data_sources             = capabilities.value.create_and_update_data_sources
      create_and_update_datasets                 = capabilities.value.create_and_update_datasets
      create_and_update_themes                   = capabilities.value.create_and_update_themes
      create_and_update_threshold_alerts         = capabilities.value.create_and_update_threshold_alerts
      create_shared_folders                      = capabilities.value.create_shared_folders
      create_spice_dataset                       = capabilities.value.create_spice_dataset
      export_to_csv                              = capabilities.value.export_to_csv
      export_to_csv_in_scheduled_reports         = capabilities.value.export_to_csv_in_scheduled_reports
      export_to_excel                            = capabilities.value.export_to_excel
      export_to_excel_in_scheduled_reports       = capabilities.value.export_to_excel_in_scheduled_reports
      export_to_pdf                              = capabilities.value.export_to_pdf
      export_to_pdf_in_scheduled_reports         = capabilities.value.export_to_pdf_in_scheduled_reports
      include_content_in_scheduled_reports_email = capabilities.value.include_content_in_scheduled_reports_email
      print_reports                              = capabilities.value.print_reports
      rename_shared_folders                      = capabilities.value.rename_shared_folders
      share_analyses                             = capabilities.value.share_analyses
      share_dashboards                           = capabilities.value.share_dashboards
      share_data_sources                         = capabilities.value.share_data_sources
      share_datasets                             = capabilities.value.share_datasets
      subscribe_dashboard_email_reports          = capabilities.value.subscribe_dashboard_email_reports
      view_account_spice_capacity                = capabilities.value.view_account_spice_capacity
    }
  }
}
