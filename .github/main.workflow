workflow "New workflow" {
  on = "push"
  resolves = [
    "Build image",
    "burdzwastaken/hadolint-action@master",
  ]
}

action "Build image" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  runs = "docker build ."
}

action "burdzwastaken/hadolint-action@master" {
  uses = "burdzwastaken/hadolint-action@master"
  secrets = ["GITHUB_TOKEN"]
}
