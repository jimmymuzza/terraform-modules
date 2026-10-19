resource "aws_redshiftdata_statement" "redshiftdata_statements" {
  for_each = var.redshiftdata_statements

  database           = each.value.database
  sql                = each.value.sql
  cluster_identifier = each.value.cluster_identifier
  db_user            = each.value.db_user
  region             = each.value.region
  secret_arn         = each.value.secret_arn
  statement_name     = each.value.statement_name
  with_event         = each.value.with_event
  workgroup_name     = each.value.workgroup_name

  dynamic "parameters" {
    for_each = each.value.parameters != null ? each.value.parameters : []
    content {
      name  = parameters.value.name
      value = parameters.value.value
    }
  }
}
