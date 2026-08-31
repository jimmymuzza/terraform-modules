variable "fsx_data_repository_associations" {
  description = <<EOT
Map of fsx_data_repository_associations, attributes below
Required:
    - data_repository_path
    - file_system_id
    - file_system_path
Optional:
    - batch_import_meta_data_on_create
    - delete_data_in_filesystem
    - imported_file_chunk_size
    - region
    - tags
    - tags_all
    - s3
EOT

  type = map(object({
    data_repository_path             = string
    file_system_id                   = string
    file_system_path                 = string
    batch_import_meta_data_on_create = optional(bool)
    delete_data_in_filesystem        = optional(bool)
    imported_file_chunk_size         = optional(number)
    region                           = optional(string)
    tags                             = optional(map(string))
    tags_all                         = optional(map(string))
    s3                               = optional(list(object({
            auto_export_policy = optional(list(object({
                events = optional(list(string))
            })))
            auto_import_policy = optional(list(object({
                events = optional(list(string))
            })))
        })))
  }))
}
