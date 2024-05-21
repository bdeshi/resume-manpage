locals {
  secrets_map = {
    aws_region              = { value = var.aws_region }
    aws_access_key_id       = { value = aws_iam_access_key.publisher.id }
    aws_secret_access_key   = { value = aws_iam_access_key.publisher.secret }
    cloudfront_distribution = { value = aws_cloudfront_distribution.created.id }
    s3_bucket               = { value = aws_s3_bucket.created.id }
  }
}

################################
####  for adduc/woodpecker  ####
################################

# adduc/woodpecker@v0.4.0 is incompatible with latest woodpecker (eg, v2.41)

# data "woodpecker_self" "current" { }
#
# resource "woodpecker_repository" "created" {
#   name = data.gitea_repo.source.name
#   # woodpecker username can come from associated gitea username
#   owner = coalesce(var.woodpecker_user, var.gitea_user, data.woodpecker_self.current.login)
#   visibility = data.gitea_repo.source.private ? "Public" : "Private"
# }

# resource "woodpecker_repository_secret" "secrets" {
#   count = length(keys(local.secrets_map))
#
#   repo_owner = woodpecker_repository.created.owner
#   repo_name  = woodpecker_repository.created.name
#   name       = upper(keys(local.secrets_map)[count.index])
#   value       = values(local.secrets_map)[count.index].value
#   events      = try(values(local.secrets_map)[count.index].events, var.woodpecker_secrets_events, [])
# }


####################################
####  for Kichiyaki/woodpecker  ####
####################################

data "woodpecker_user" "current" {
  login = ""
}

resource "woodpecker_repository" "created" {
  full_name = join("/", [
    coalesce(var.woodpecker_user, var.gitea_user, data.woodpecker_user.current.login),
    data.gitea_repo.source.name
  ])

  visibility = data.gitea_repo.source.private ? "private" : "public"
}

resource "woodpecker_repository_secret" "secrets" {
  count = length(keys(local.secrets_map))

  repository_id = woodpecker_repository.created.id
  name          = upper(keys(local.secrets_map)[count.index])
  value         = values(local.secrets_map)[count.index].value
  events        = try(values(local.secrets_map)[count.index].events, var.woodpecker_secrets_events, [])
}
