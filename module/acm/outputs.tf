output "cert_alb_arn" {
  value = aws_acm_certificate.cert_alb.arn
}

output "cert_cloudfront_arn" {
  value = aws_acm_certificate.cert_cloudfront.arn
}