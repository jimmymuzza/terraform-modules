output "glue_catalog_tables" {
  description = "All glue_catalog_table resources"
  value       = aws_glue_catalog_table.glue_catalog_tables
}
