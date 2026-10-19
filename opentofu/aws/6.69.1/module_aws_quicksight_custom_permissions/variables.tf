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
            action                                     = optional(string)
            add_or_run_anomaly_detection_for_analyses  = optional(string)
            analysis                                   = optional(string)
            automate                                   = optional(string)
            chat_agent                                 = optional(string)
            create_and_update_dashboard_email_reports  = optional(string)
            create_and_update_data_sources             = optional(string)
            create_and_update_datasets                 = optional(string)
            create_and_update_themes                   = optional(string)
            create_and_update_threshold_alerts         = optional(string)
            create_chat_agents                         = optional(string)
            create_shared_folders                      = optional(string)
            create_spice_dataset                       = optional(string)
            dashboard                                  = optional(string)
            export_to_csv                              = optional(string)
            export_to_csv_in_scheduled_reports         = optional(string)
            export_to_excel                            = optional(string)
            export_to_excel_in_scheduled_reports       = optional(string)
            export_to_pdf                              = optional(string)
            export_to_pdf_in_scheduled_reports         = optional(string)
            flow                                       = optional(string)
            include_content_in_scheduled_reports_email = optional(string)
            knowledge_base                             = optional(string)
            perform_flow_ui_task                       = optional(string)
            print_reports                              = optional(string)
            publish_without_approval                   = optional(string)
            rename_shared_folders                      = optional(string)
            research                                   = optional(string)
            share_analyses                             = optional(string)
            share_dashboards                           = optional(string)
            share_data_sources                         = optional(string)
            share_datasets                             = optional(string)
            space                                      = optional(string)
            subscribe_dashboard_email_reports          = optional(string)
            use_agent_web_search                       = optional(string)
            use_bedrock_models                         = optional(string)
            view_account_spice_capacity                = optional(string)
        })))
  }))
}
