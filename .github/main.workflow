workflow "New workflow" {
  on = "push"
  resolves = [
    "Hadolint",
    "Build image",
    "Hello World",
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

action "Lint" {
  uses = "./lint/"
}

action "Hello World" {
  uses = "./.github/lint"
  args = "Hi"
}
