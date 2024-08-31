variable "zone_id" {}
variable "domain_name" {}
variable "sans" {}
provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}