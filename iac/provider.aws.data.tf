data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "s3_cloudfront_access" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
    actions = [
      "s3:GetObject",
      "s3:ListBucket"
    ]
    resources = [
      aws_s3_bucket.created.arn,
      "${aws_s3_bucket.created.arn}/*"
    ]
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [aws_cloudfront_distribution.created.arn]
    }
  }
}

data "aws_iam_policy_document" "pubilsher" {
  statement {
    actions = [
      "s3:*",
      "cloudfront:*"
    ]
    resources = [
      aws_s3_bucket.created.arn,
      "${aws_s3_bucket.created.arn}/*",
      aws_cloudfront_distribution.created.arn
    ]
  }
}
