resource "aws_sagemaker_servicecatalog_portfolio_status" "sagemaker_servicecatalog_portfolio_status" {
  for_each = var.sagemaker_servicecatalog_portfolio_status

  status = each.value.status
  region = each.value.region
}
