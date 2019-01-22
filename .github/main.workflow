workflow "New workflow" {
  on = "push"
  resolves = [
    "Hadolint",
    "Build image",
  ]
}

action "Build image" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  runs = "docker build ."
}

action "Hadolint" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  runs = "run --rm -i hadolint/hadolint < Dockerfile"
}
