resource "aws_neptunegraph_private_graph_endpoint" "neptunegraph_private_graph_endpoints" {
  for_each = var.neptunegraph_private_graph_endpoints

  graph_identifier       = each.value.graph_identifier
  vpc_id                 = each.value.vpc_id
  region                 = each.value.region
  subnet_ids             = each.value.subnet_ids
  vpc_security_group_ids = each.value.vpc_security_group_ids
}
