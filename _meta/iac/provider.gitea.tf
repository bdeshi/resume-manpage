data "gitea_user" "current" {}

data "gitea_repo" "source" {
  name     = var.gitea_repo
  username = coalesce(var.gitea_user, data.gitea_user.current.username)
}
