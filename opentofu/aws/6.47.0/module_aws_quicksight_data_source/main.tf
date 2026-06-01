resource "aws_quicksight_data_source" "quicksight_data_sources" {
  for_each = var.quicksight_data_sources

  data_source_id = each.value.data_source_id
  name           = each.value.name
  type           = each.value.type
  aws_account_id = each.value.aws_account_id
  region         = each.value.region
  tags           = each.value.tags
  tags_all       = each.value.tags_all

  dynamic "credentials" {
    for_each = each.value.credentials != null ? each.value.credentials : []
    content {
      copy_source_arn = credentials.value.copy_source_arn
      secret_arn      = credentials.value.secret_arn

      dynamic "credential_pair" {
        for_each = credentials.value.credential_pair != null ? credentials.value.credential_pair : []
        content {
          password = credential_pair.value.password
          username = credential_pair.value.username
        }
      }
    }
  }

  dynamic "parameters" {
    for_each = each.value.parameters != null ? each.value.parameters : []
    content {

      dynamic "amazon_elasticsearch" {
        for_each = parameters.value.amazon_elasticsearch != null ? parameters.value.amazon_elasticsearch : []
        content {
          domain = amazon_elasticsearch.value.domain
        }
      }

      dynamic "athena" {
        for_each = parameters.value.athena != null ? parameters.value.athena : []
        content {
          role_arn   = athena.value.role_arn
          work_group = athena.value.work_group
        }
      }

      dynamic "aurora" {
        for_each = parameters.value.aurora != null ? parameters.value.aurora : []
        content {
          database = aurora.value.database
          host     = aurora.value.host
          port     = aurora.value.port
        }
      }

      dynamic "aurora_postgresql" {
        for_each = parameters.value.aurora_postgresql != null ? parameters.value.aurora_postgresql : []
        content {
          database = aurora_postgresql.value.database
          host     = aurora_postgresql.value.host
          port     = aurora_postgresql.value.port
        }
      }

      dynamic "aws_iot_analytics" {
        for_each = parameters.value.aws_iot_analytics != null ? parameters.value.aws_iot_analytics : []
        content {
          data_set_name = aws_iot_analytics.value.data_set_name
        }
      }

      dynamic "databricks" {
        for_each = parameters.value.databricks != null ? parameters.value.databricks : []
        content {
          host              = databricks.value.host
          port              = databricks.value.port
          sql_endpoint_path = databricks.value.sql_endpoint_path
        }
      }

      dynamic "jira" {
        for_each = parameters.value.jira != null ? parameters.value.jira : []
        content {
          site_base_url = jira.value.site_base_url
        }
      }

      dynamic "maria_db" {
        for_each = parameters.value.maria_db != null ? parameters.value.maria_db : []
        content {
          database = maria_db.value.database
          host     = maria_db.value.host
          port     = maria_db.value.port
        }
      }

      dynamic "mysql" {
        for_each = parameters.value.mysql != null ? parameters.value.mysql : []
        content {
          database = mysql.value.database
          host     = mysql.value.host
          port     = mysql.value.port
        }
      }

      dynamic "oracle" {
        for_each = parameters.value.oracle != null ? parameters.value.oracle : []
        content {
          database = oracle.value.database
          host     = oracle.value.host
          port     = oracle.value.port
        }
      }

      dynamic "postgresql" {
        for_each = parameters.value.postgresql != null ? parameters.value.postgresql : []
        content {
          database = postgresql.value.database
          host     = postgresql.value.host
          port     = postgresql.value.port
        }
      }

      dynamic "presto" {
        for_each = parameters.value.presto != null ? parameters.value.presto : []
        content {
          catalog = presto.value.catalog
          host    = presto.value.host
          port    = presto.value.port
        }
      }

      dynamic "rds" {
        for_each = parameters.value.rds != null ? parameters.value.rds : []
        content {
          database    = rds.value.database
          instance_id = rds.value.instance_id
        }
      }

      dynamic "redshift" {
        for_each = parameters.value.redshift != null ? parameters.value.redshift : []
        content {
          database   = redshift.value.database
          cluster_id = redshift.value.cluster_id
          host       = redshift.value.host
          port       = redshift.value.port
        }
      }

      dynamic "s3" {
        for_each = parameters.value.s3 != null ? parameters.value.s3 : []
        content {
          role_arn = s3.value.role_arn

          dynamic "manifest_file_location" {
            for_each = s3.value.manifest_file_location != null ? s3.value.manifest_file_location : []
            content {
              bucket = manifest_file_location.value.bucket
              key    = manifest_file_location.value.key
            }
          }
        }
      }

      dynamic "service_now" {
        for_each = parameters.value.service_now != null ? parameters.value.service_now : []
        content {
          site_base_url = service_now.value.site_base_url
        }
      }

      dynamic "snowflake" {
        for_each = parameters.value.snowflake != null ? parameters.value.snowflake : []
        content {
          database  = snowflake.value.database
          host      = snowflake.value.host
          warehouse = snowflake.value.warehouse
        }
      }

      dynamic "spark" {
        for_each = parameters.value.spark != null ? parameters.value.spark : []
        content {
          host = spark.value.host
          port = spark.value.port
        }
      }

      dynamic "sql_server" {
        for_each = parameters.value.sql_server != null ? parameters.value.sql_server : []
        content {
          database = sql_server.value.database
          host     = sql_server.value.host
          port     = sql_server.value.port
        }
      }

      dynamic "teradata" {
        for_each = parameters.value.teradata != null ? parameters.value.teradata : []
        content {
          database = teradata.value.database
          host     = teradata.value.host
          port     = teradata.value.port
        }
      }

      dynamic "twitter" {
        for_each = parameters.value.twitter != null ? parameters.value.twitter : []
        content {
          max_rows = twitter.value.max_rows
          query    = twitter.value.query
        }
      }
    }
  }

  dynamic "permission" {
    for_each = each.value.permission != null ? each.value.permission : []
    content {
      actions   = permission.value.actions
      principal = permission.value.principal
    }
  }

  dynamic "ssl_properties" {
    for_each = each.value.ssl_properties != null ? each.value.ssl_properties : []
    content {
      disable_ssl = ssl_properties.value.disable_ssl
    }
  }

  dynamic "vpc_connection_properties" {
    for_each = each.value.vpc_connection_properties != null ? each.value.vpc_connection_properties : []
    content {
      vpc_connection_arn = vpc_connection_properties.value.vpc_connection_arn
    }
  }
}
