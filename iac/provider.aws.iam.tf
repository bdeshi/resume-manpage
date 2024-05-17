resource "aws_iam_user" "publisher" {
  name          = "${var.domain_name}_publisher"
  path          = "/${var.aws_tag_iac_identifier}/${local.workspace_env}/"
  force_destroy = true
}

resource "aws_iam_access_key" "publisher" {
  user = aws_iam_user.publisher.name
}

resource "aws_iam_policy" "publisher" {
  name_prefix = "${var.domain_name}_publisher"
  policy      = data.aws_iam_policy_document.pubilsher.json
}

resource "aws_iam_user_policy_attachment" "publisher" {
  policy_arn = aws_iam_policy.publisher.arn
  user       = aws_iam_user.publisher.name
}
