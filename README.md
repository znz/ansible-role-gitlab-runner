# Ansible role for GitLab Runner

Setup [GitLab Runner](https://docs.gitlab.com/runner/).

## Requirements

- Debian
- Ubuntu

## Role Variables

- `gitlab_runner_coordinator_url`: The GitLab coordinator URL.
- `gitlab_runner_registration_token`: The GitLab registration token. If this is specified, a runner will be registered to a GitLab server.
- `gitlab_runner_description`: The description of the runner. (Default: hostname)
- `gitlab_runner_executor`: The executor used by the runner. (Default: `"docker"`)
- `gitlab_runner_docker_image`: The default Docker image to use. Required when executor is `docker`. (Default: "hello-world")
- `gitlab_runner_tags`: The tags assigned to the runner, Defaults to an empty list.
- `gitlab_runner_register_options`: ""

## Dependencies

- docker

## Example Playbook

Example:

    - hosts: servers
      become: yes
      roles:
      - znz.docker
      - znz.gitlab-runner
        gitlab_runner_coordinator_url: "http://gitlab.example.test/"
        gitlab_runner_registration_token: "GITLAB_RUNNER_REGISTRATION_TOKEN"

Another example:

    - hosts: all
      become: yes
      roles:
      - znz.docker
        docker_daemon_config:
          insecure-registries:
          - "registry.example.test"
      - znz.gitlab-runner
        gitlab_runner_coordinator_url: "http://gitlab.example.test/"
        gitlab_runner_registration_token: "GITLAB_RUNNER_REGISTRATION_TOKEN"
        gitlab_runner_register_options: >-
          --docker-volumes /var/run/docker.sock:/var/run/docker.sock

## License

MIT License
