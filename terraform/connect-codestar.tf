resource "aws_codestarconnections_connection" "github_codepipeline" {
  name          = "github-codepipeline"
  provider_type = "GitHub"
}