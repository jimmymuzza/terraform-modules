variable "dms_data_providers" {
  description = <<EOT
Map of dms_data_providers, attributes below
Required:
    - engine
Optional:
    - description
    - name
    - region
    - tags
    - virtual
    - settings
EOT

  type = map(object({
    engine      = string
    description = optional(string)
    name        = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
    virtual     = optional(bool)
    settings    = optional(list(object({
            doc_db_settings               = optional(list(object({
                certificate_arn = optional(string)
                database_name   = optional(string)
                port            = optional(number)
                server_name     = optional(string)
                ssl_mode        = optional(string)
            })))
            ibm_db2_luw_settings          = optional(list(object({
                certificate_arn      = optional(string)
                database_name        = optional(string)
                encryption_algorithm = optional(number)
                port                 = optional(number)
                s3_access_role_arn   = optional(string)
                s3_path              = optional(string)
                security_mechanism   = optional(number)
                server_name          = optional(string)
                ssl_mode             = optional(string)
            })))
            ibm_db2_zos_settings          = optional(list(object({
                certificate_arn    = optional(string)
                database_name      = optional(string)
                port               = optional(number)
                s3_access_role_arn = optional(string)
                s3_path            = optional(string)
                server_name        = optional(string)
                ssl_mode           = optional(string)
            })))
            maria_db_settings             = optional(list(object({
                certificate_arn    = optional(string)
                port               = optional(number)
                s3_access_role_arn = optional(string)
                s3_path            = optional(string)
                server_name        = optional(string)
                ssl_mode           = optional(string)
            })))
            microsoft_sql_server_settings = optional(list(object({
                certificate_arn    = optional(string)
                database_name      = optional(string)
                port               = optional(number)
                s3_access_role_arn = optional(string)
                s3_path            = optional(string)
                server_name        = optional(string)
                ssl_mode           = optional(string)
            })))
            mongo_db_settings             = optional(list(object({
                auth_mechanism  = optional(string)
                auth_source     = optional(string)
                auth_type       = optional(string)
                certificate_arn = optional(string)
                database_name   = optional(string)
                port            = optional(number)
                server_name     = optional(string)
                ssl_mode        = optional(string)
            })))
            mysql_settings                = optional(list(object({
                certificate_arn    = optional(string)
                port               = optional(number)
                s3_access_role_arn = optional(string)
                s3_path            = optional(string)
                server_name        = optional(string)
                ssl_mode           = optional(string)
            })))
            oracle_settings               = optional(list(object({
                asm_server                                             = optional(string)
                certificate_arn                                        = optional(string)
                database_name                                          = optional(string)
                port                                                   = optional(number)
                s3_access_role_arn                                     = optional(string)
                s3_path                                                = optional(string)
                secrets_manager_oracle_asm_access_role_arn             = optional(string)
                secrets_manager_oracle_asm_secret_id                   = optional(string)
                secrets_manager_security_db_encryption_access_role_arn = optional(string)
                secrets_manager_security_db_encryption_secret_id       = optional(string)
                server_name                                            = optional(string)
                ssl_mode                                               = optional(string)
            })))
            postgresql_settings           = optional(list(object({
                certificate_arn    = optional(string)
                database_name      = optional(string)
                port               = optional(number)
                s3_access_role_arn = optional(string)
                s3_path            = optional(string)
                server_name        = optional(string)
                ssl_mode           = optional(string)
            })))
            redshift_settings             = optional(list(object({
                database_name      = optional(string)
                port               = optional(number)
                s3_access_role_arn = optional(string)
                s3_path            = optional(string)
                server_name        = optional(string)
            })))
            sybase_ase_settings           = optional(list(object({
                certificate_arn  = optional(string)
                database_name    = optional(string)
                encrypt_password = optional(bool)
                port             = optional(number)
                server_name      = optional(string)
                ssl_mode         = optional(string)
            })))
        })))
  }))
}
