variable "data_share_dataset_data_lake_gen2s" {
  description = <<EOT
Map of data_share_dataset_data_lake_gen2s, attributes below
Required:
    - file_system_name
    - name
    - share_id
    - storage_account_id
Optional:
    - file_path
    - folder_path
EOT

  type = map(object({
    file_system_name   = string
    name               = string
    share_id           = string
    storage_account_id = string
    file_path          = optional(string)
    folder_path        = optional(string)
  }))
}
