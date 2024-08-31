##Route53 Records
resource "aws_route53_record" "default" {
  zone_id = var.zone_id
  name    = var.zone_name
  type    = var.record_type
  alias {
    name                   = var.distribution_domain_name
    zone_id                = var.distribution_hosted_zone_id
    evaluate_target_health = true
  }
}