variable "general_config" {
  type = map(any)
}
variable "cf_cname" {}
variable "domain_name" {}
variable "alb_id" {}
variable "cert_cloudfront_arn" {}
variable "cloudfront_access_log_bucket_domain_name" {}