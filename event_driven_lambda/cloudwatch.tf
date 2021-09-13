resource "aws_cloudwatch_log_group" "cw_log_group" {
  name              = "/aws/lambda/${var.function_name}"
  retention_in_days = 14
}