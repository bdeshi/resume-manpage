terraform {
  required_version = "~> 1.8.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.49.0"
    }
    # woodpecker = {
    #   source  = "adduc/woodpecker"
    #   version = "~> 0.4.0"
    # }
    woodpecker = {
      source  = "Kichiyaki/woodpecker"
      version = "~> 0.3.0"
    }
    gitea = {
      source  = "go-gitea/gitea"
      version = "~>0.3.0"
    }
  }

  backend "remote" {}

  # cloud {
  #   organization = collected from TF_CLOUD_ORGANIZATION env
  #   workspaces {
  #     project = collected from TF_CLOUD_PROJECT env
  #   }
  # }

}

provider "aws" {
  # profile = collected from AWS_PROFILE env
  region = var.aws_region
  default_tags {
    tags = {
      "ManagedBy"       = var.aws_tag_iac_identifier
      "iac/project"     = var.aws_tag_iac_project_name
      "iac/source"      = "${data.gitea_repo.source.ssh_url}/${var.aws_tag_iac_project_subpath}"
      "iac/environment" = local.workspace_env
    }
  }
}

provider "woodpecker" {
  # server = collected from WOODPECKER_SERVER env
  # token =  collected from WOODPECKER_TOKEN env
}

provider "gitea" {
  # base_url = collected from GITEA_BASE_URL env
  # token = collected from GITEA_TOKEN env
}
