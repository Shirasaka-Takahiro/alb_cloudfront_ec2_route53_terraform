##Cloudfront
resource "aws_cloudfront_distribution" "default" {
  enabled = true
  aliases = [
    var.cf_cname
  ]

  origin {
    domain_name = var.domain_name
    origin_id   = var.alb_id
    custom_origin_config {
      http_port                = 80
      https_port               = 443
      origin_keepalive_timeout = 5
      origin_protocol_policy   = "https-only"
      origin_read_timeout      = 60
      origin_ssl_protocols     = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = false
    acm_certificate_arn            = var.cert_cloudfront_arn
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  default_cache_behavior {
    # Using the CachingDisabled managed policy ID:
    cache_policy_id  = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"
    allowed_methods  = ["HEAD", "DELETE", "POST", "GET", "OPTIONS", "PUT", "PATCH"]
    cached_methods   = ["HEAD", "GET", "OPTIONS"]
    target_origin_id = var.alb_id

    viewer_protocol_policy   = "redirect-to-https"
    min_ttl                  = 0
    default_ttl              = 10
    max_ttl                  = 60
    origin_request_policy_id = data.aws_cloudfront_origin_request_policy.default.id
  }
}

## Managed Origin Request Policy
data "aws_cloudfront_origin_request_policy" "default" {
  name = "Managed-AllViewerAndCloudFrontHeaders-2022-06"
}