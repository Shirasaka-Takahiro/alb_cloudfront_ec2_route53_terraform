variable "general_config" {
  type = map(any)
}
variable "cf_cname" {}
variable "domain_name" {}
variable "alb_dns_name" {}
variable "cert_cloudfront_arn" {}