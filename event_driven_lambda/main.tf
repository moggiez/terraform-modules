
resource "aws_s3_bucket_object" "lambda_s3_object" {
  bucket = var.s3_bucket.id
  key    = "${var.key}.zip"
  acl    = "private"
  source = "${var.dist_dir}/${var.key}.zip"
  etag   = filemd5("${var.dist_dir}/${var.key}.zip")
}

resource "aws_lambda_function" "_" {
  function_name = var.function_name
  s3_bucket     = var.s3_bucket.bucket
  s3_key        = aws_s3_bucket_object.lambda_s3_object.key
  timeout       = var.timeout

  handler          = "index.handler"
  runtime          = "nodejs14.x"
  source_code_hash = filebase64sha256("${var.dist_dir}/${var.key}.zip")

  layers = var.layers != null ? var.layers : []

  role = aws_iam_role._.arn

  depends_on = [
    aws_iam_role_policy_attachment.lambda_logs,
    aws_cloudwatch_log_group.cw_log_group,
  ]
}
