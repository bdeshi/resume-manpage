####################
####   commons  ####
####################

variable "domain_name" {
  type        = string
  description = "domain name where the built site is published."
}


################
####   aws  ####
################

variable "aws_tag_iac_identifier" {
  type        = string
  default     = "iac/terraform"
  description = "IaC tool name added as a tag to AWS resources, also used in iam user path."
}

variable "aws_tag_iac_project_name" {
  type        = string
  description = "IaC project name added as a tag to AWS resources."
}

variable "aws_tag_iac_project_subpath" {
  type        = string
  description = "IaC project source path added as a tag to AWS resources."
}

variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region passed to AWS provider."
}

variable "aws_s3_bucket_prefix" {
  type        = string
  default     = null
  description = "AWS S3 bucket name prefix."
}

variable "aws_s3_use_domain_prefix" {
  type        = bool
  default     = true
  description = "use var.domain_name as AWS S3 bucket name prefix."
}

variable "aws_s3_force_destroy" {
  type        = bool
  default     = true
  description = "delete all bucket objects to allow clean bucket destroy operation."
}

variable "aws_cloudfront_default_root_object" {
  type        = string
  default     = "index.html"
  description = "default root object name for the CloudFront distribution."
}

variable "aws_cloudfront_price_class" {
  type        = string
  default     = "PriceClass_200"
  description = "price class for the CloudFront distribution: PriceClass_All|PriceClass_200|PriceClass_100."
}

variable "aws_cloudfront_minimum_protocol_version" {
  type        = string
  default     = "TLSv1.2_2021"
  description = "name of the minimum SSL protocol version used by CloudFront for HTTPS requests."
}

################
#### gitea  ####
################

variable "gitea_repo" {
  type        = string
  description = "name of source Gitea repository."
}

variable "gitea_user" {
  type        = string
  default     = null
  description = "username of Gitea repo owner."
}


################
#  woodpecker  #
################

variable "woodpecker_user" {
  type        = string
  default     = null
  description = "username of Woodpecker server."
}

variable "woodpecker_secrets_events" {
  type        = list(string)
  default     = ["push"]
  description = "default list of allowed events for Woodpecker secrets created."
}
