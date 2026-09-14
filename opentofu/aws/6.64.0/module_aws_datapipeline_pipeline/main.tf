resource "aws_datapipeline_pipeline" "datapipeline_pipelines" {
  for_each = var.datapipeline_pipelines

  name        = each.value.name
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all
}
