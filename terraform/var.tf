variable "DOCKER_USER" {
  description = "Username for docker hub to build images"
  type        = string
}

variable "DOCKER_PASS" {
  description = "Password for docker hub"
}

variable "Github_Repo" {
    description = "Enter the repo directory to the forked repo <username>/ci-comparison-blog"
}