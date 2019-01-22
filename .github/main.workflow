workflow "New workflow" {
  on = "push"
  resolves = [
    "Build image",
    "Hello World",
  ]
}

action "Build image" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  runs = "docker build ."
}

action "Hello World" {
  uses = "./.github/lint"
  args = "Hi"
}
