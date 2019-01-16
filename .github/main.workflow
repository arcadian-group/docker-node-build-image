workflow "New workflow" {
  on = "push"
  resolves = [
    "GitHub Action for Docker",
    "Hadolint",
  ]
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  runs = "docker build ."
}

action "Hadolint" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  runs = "docker run --rm -i hadolint/hadolint < Dockerfile"
}
