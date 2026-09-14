resource "aws_dms_data_provider" "dms_data_providers" {
  for_each = var.dms_data_providers

  engine      = each.value.engine
  description = each.value.description
  name        = each.value.name
  region      = each.value.region
  tags        = each.value.tags
  virtual     = each.value.virtual

  dynamic "settings" {
    for_each = each.value.settings != null ? each.value.settings : []
    content {

      dynamic "doc_db_settings" {
        for_each = settings.value.doc_db_settings != null ? settings.value.doc_db_settings : []
        content {
          certificate_arn = doc_db_settings.value.certificate_arn
          database_name   = doc_db_settings.value.database_name
          port            = doc_db_settings.value.port
          server_name     = doc_db_settings.value.server_name
          ssl_mode        = doc_db_settings.value.ssl_mode
        }
      }

      dynamic "ibm_db2_luw_settings" {
        for_each = settings.value.ibm_db2_luw_settings != null ? settings.value.ibm_db2_luw_settings : []
        content {
          certificate_arn      = ibm_db2_luw_settings.value.certificate_arn
          database_name        = ibm_db2_luw_settings.value.database_name
          encryption_algorithm = ibm_db2_luw_settings.value.encryption_algorithm
          port                 = ibm_db2_luw_settings.value.port
          s3_access_role_arn   = ibm_db2_luw_settings.value.s3_access_role_arn
          s3_path              = ibm_db2_luw_settings.value.s3_path
          security_mechanism   = ibm_db2_luw_settings.value.security_mechanism
          server_name          = ibm_db2_luw_settings.value.server_name
          ssl_mode             = ibm_db2_luw_settings.value.ssl_mode
        }
      }

      dynamic "ibm_db2_zos_settings" {
        for_each = settings.value.ibm_db2_zos_settings != null ? settings.value.ibm_db2_zos_settings : []
        content {
          certificate_arn    = ibm_db2_zos_settings.value.certificate_arn
          database_name      = ibm_db2_zos_settings.value.database_name
          port               = ibm_db2_zos_settings.value.port
          s3_access_role_arn = ibm_db2_zos_settings.value.s3_access_role_arn
          s3_path            = ibm_db2_zos_settings.value.s3_path
          server_name        = ibm_db2_zos_settings.value.server_name
          ssl_mode           = ibm_db2_zos_settings.value.ssl_mode
        }
      }

      dynamic "maria_db_settings" {
        for_each = settings.value.maria_db_settings != null ? settings.value.maria_db_settings : []
        content {
          certificate_arn    = maria_db_settings.value.certificate_arn
          port               = maria_db_settings.value.port
          s3_access_role_arn = maria_db_settings.value.s3_access_role_arn
          s3_path            = maria_db_settings.value.s3_path
          server_name        = maria_db_settings.value.server_name
          ssl_mode           = maria_db_settings.value.ssl_mode
        }
      }

      dynamic "microsoft_sql_server_settings" {
        for_each = settings.value.microsoft_sql_server_settings != null ? settings.value.microsoft_sql_server_settings : []
        content {
          certificate_arn    = microsoft_sql_server_settings.value.certificate_arn
          database_name      = microsoft_sql_server_settings.value.database_name
          port               = microsoft_sql_server_settings.value.port
          s3_access_role_arn = microsoft_sql_server_settings.value.s3_access_role_arn
          s3_path            = microsoft_sql_server_settings.value.s3_path
          server_name        = microsoft_sql_server_settings.value.server_name
          ssl_mode           = microsoft_sql_server_settings.value.ssl_mode
        }
      }

      dynamic "mongo_db_settings" {
        for_each = settings.value.mongo_db_settings != null ? settings.value.mongo_db_settings : []
        content {
          auth_mechanism  = mongo_db_settings.value.auth_mechanism
          auth_source     = mongo_db_settings.value.auth_source
          auth_type       = mongo_db_settings.value.auth_type
          certificate_arn = mongo_db_settings.value.certificate_arn
          database_name   = mongo_db_settings.value.database_name
          port            = mongo_db_settings.value.port
          server_name     = mongo_db_settings.value.server_name
          ssl_mode        = mongo_db_settings.value.ssl_mode
        }
      }

      dynamic "mysql_settings" {
        for_each = settings.value.mysql_settings != null ? settings.value.mysql_settings : []
        content {
          certificate_arn    = mysql_settings.value.certificate_arn
          port               = mysql_settings.value.port
          s3_access_role_arn = mysql_settings.value.s3_access_role_arn
          s3_path            = mysql_settings.value.s3_path
          server_name        = mysql_settings.value.server_name
          ssl_mode           = mysql_settings.value.ssl_mode
        }
      }

      dynamic "oracle_settings" {
        for_each = settings.value.oracle_settings != null ? settings.value.oracle_settings : []
        content {
          asm_server                                             = oracle_settings.value.asm_server
          certificate_arn                                        = oracle_settings.value.certificate_arn
          database_name                                          = oracle_settings.value.database_name
          port                                                   = oracle_settings.value.port
          s3_access_role_arn                                     = oracle_settings.value.s3_access_role_arn
          s3_path                                                = oracle_settings.value.s3_path
          secrets_manager_oracle_asm_access_role_arn             = oracle_settings.value.secrets_manager_oracle_asm_access_role_arn
          secrets_manager_oracle_asm_secret_id                   = oracle_settings.value.secrets_manager_oracle_asm_secret_id
          secrets_manager_security_db_encryption_access_role_arn = oracle_settings.value.secrets_manager_security_db_encryption_access_role_arn
          secrets_manager_security_db_encryption_secret_id       = oracle_settings.value.secrets_manager_security_db_encryption_secret_id
          server_name                                            = oracle_settings.value.server_name
          ssl_mode                                               = oracle_settings.value.ssl_mode
        }
      }

      dynamic "postgresql_settings" {
        for_each = settings.value.postgresql_settings != null ? settings.value.postgresql_settings : []
        content {
          certificate_arn    = postgresql_settings.value.certificate_arn
          database_name      = postgresql_settings.value.database_name
          port               = postgresql_settings.value.port
          s3_access_role_arn = postgresql_settings.value.s3_access_role_arn
          s3_path            = postgresql_settings.value.s3_path
          server_name        = postgresql_settings.value.server_name
          ssl_mode           = postgresql_settings.value.ssl_mode
        }
      }

      dynamic "redshift_settings" {
        for_each = settings.value.redshift_settings != null ? settings.value.redshift_settings : []
        content {
          database_name      = redshift_settings.value.database_name
          port               = redshift_settings.value.port
          s3_access_role_arn = redshift_settings.value.s3_access_role_arn
          s3_path            = redshift_settings.value.s3_path
          server_name        = redshift_settings.value.server_name
        }
      }

      dynamic "sybase_ase_settings" {
        for_each = settings.value.sybase_ase_settings != null ? settings.value.sybase_ase_settings : []
        content {
          certificate_arn  = sybase_ase_settings.value.certificate_arn
          database_name    = sybase_ase_settings.value.database_name
          encrypt_password = sybase_ase_settings.value.encrypt_password
          port             = sybase_ase_settings.value.port
          server_name      = sybase_ase_settings.value.server_name
          ssl_mode         = sybase_ase_settings.value.ssl_mode
        }
      }
    }
  }
}
