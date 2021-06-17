resource "aws_route53_record" "_" {
  name    = aws_api_gateway_domain_name._.domain_name
  type    = "A"
  zone_id = var.hosted_zone_id

  alias {
    evaluate_target_health = true
    name                   = aws_api_gateway_domain_name._.cloudfront_domain_name
    zone_id                = aws_api_gateway_domain_name._.cloudfront_zone_id
  }
}