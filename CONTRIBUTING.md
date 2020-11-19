# Contributing

This guide is intended for project contributors.

**Working on your first Pull Request?** You can learn how from this *free* series [How to Contribute to an Open Source Project on GitHub](https://kcd.im/pull-request)

## Code of Conduct

Please make sure you're familiar with and follow the [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).

## Reviewing Pull Requests

1. Ensure you have locally built and tested the Docker container.

## Approving Pull Requests

1. Ensure there are no common Dockerfile pitfalls by _linting_ with [hadolint](https://github.com/hadolint/hadolint).
```bash
hadolint Dockerfile
```
1. Ensure the merge message conforms to [Conventional Commits](https://conventionalcommits.org/) spec.
1. Breaking changes? Ensure the commit message contains the text `BREAKING CHANGE:`.
1. Use "Squash and Merge". This keeps a clean history in `main`, with a full history available in Pull Requests.

## Releasing

1. A [GitHub Actions](https://github.com/features/actions) is triggered when any code is pushed to `main`. The action will `test` the build and all tests pass, it will then use [semantic-release](https://github.com/semantic-release/semantic-release#-semantic-release) to generate additionals files as well as `tagging` the branch with the new `version`. 
1. Any code pushed or merged to the GitHub `main` branch will trigger a Docker build which is published to the `@latest` [DockerHub](https://hub.docker.com/) tag.
1. Any version `tag` pushed to GitHub will trigger a Docker build, and the container will be published to [DockerHub](https://hub.docker.com/) using the same version number.

