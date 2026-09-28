variable "quicksight_custom_permissions" {
  description = <<EOT
Map of quicksight_custom_permissions, attributes below
Required:
    - custom_permissions_name
Optional:
    - aws_account_id
    - region
    - tags
    - capabilities
EOT

  type = map(object({
    custom_permissions_name = string
    aws_account_id          = optional(string)
    region                  = optional(string)
    tags                    = optional(map(string))
    capabilities            = optional(list(object({
            add_or_run_anomaly_detection_for_analyses  = optional(string)
            create_and_update_dashboard_email_reports  = optional(string)
            create_and_update_data_sources             = optional(string)
            create_and_update_datasets                 = optional(string)
            create_and_update_themes                   = optional(string)
            create_and_update_threshold_alerts         = optional(string)
            create_shared_folders                      = optional(string)
            create_spice_dataset                       = optional(string)
            export_to_csv                              = optional(string)
            export_to_csv_in_scheduled_reports         = optional(string)
            export_to_excel                            = optional(string)
            export_to_excel_in_scheduled_reports       = optional(string)
            export_to_pdf                              = optional(string)
            export_to_pdf_in_scheduled_reports         = optional(string)
            include_content_in_scheduled_reports_email = optional(string)
            print_reports                              = optional(string)
            rename_shared_folders                      = optional(string)
            share_analyses                             = optional(string)
            share_dashboards                           = optional(string)
            share_data_sources                         = optional(string)
            share_datasets                             = optional(string)
            subscribe_dashboard_email_reports          = optional(string)
            view_account_spice_capacity                = optional(string)
        })))
  }))
}
