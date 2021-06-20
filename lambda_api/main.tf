resource "aws_iam_policy" "dynamodb_access_policy" {
  name = "${var.name}_api_lambda_access_dynamodb_policy"
  path = "/"

  policy = templatefile("templates/dynamo_access_policy.json", { table = var.dynamodb_table })
}

module "lambda_for_api" {
  source      = "git@github.com:moggiez/terraform-modules.git//lambda_with_dynamo"
  s3_bucket   = var.bucket
  dist_dir    = var.dist_dir
  name        = "${var.name}_api"
  policies    = concat(var.policies, [aws_iam_policy.dynamodb_access_policy.arn])
  layers      = var.layers
  environment = local.environment
}

module "gateway_to_lambda" {
  source             = "git@github.com:moggiez/terraform-modules.git//lambda_gateway"
  api                = var.api
  lambda             = module.lambda_for_api.lambda
  http_methods       = var.http_methods
  resource_path_part = var.path_part
  authorizer         = var.authorizer
}

module "gateway_cors" {
  source          = "git@github.com:moggiez/terraform-modules.git//api_gateway_enable_cors"
  api_id          = var.api.id
  api_resource_id = module.gateway_to_lambda.api_resource.id
}

resource "aws_lambda_permission" "_" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = module.lambda_for_api.lambda.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${var.api.execution_arn}/*/*"
}