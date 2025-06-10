data "aws_iam_policy_document" "assume_github_oidc" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"
    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/token.actions.githubusercontent.com"]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:${var.github_repo}:*"]
    }
  }
}

resource "aws_iam_role" "github_oidc_role" {
  name               = "github-oidc-role"
  assume_role_policy = data.aws_iam_policy_document.assume_github_oidc.json
}

resource "aws_iam_role_policy_attachment" "oidc_attach" {
  role       = aws_iam_role.github_oidc_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess" # least privilege is recommended!
}

data "aws_caller_identity" "current" {}
