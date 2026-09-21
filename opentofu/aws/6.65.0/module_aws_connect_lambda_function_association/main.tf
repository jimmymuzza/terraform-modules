resource "aws_connect_lambda_function_association" "connect_lambda_function_associations" {
  for_each = var.connect_lambda_function_associations

  function_arn = each.value.function_arn
  instance_id  = each.value.instance_id
  region       = each.value.region
}
