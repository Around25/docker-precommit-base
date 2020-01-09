# docker-precommit-base

A docker image that allows you to run pre-commit checks for Python, Node or Go in a Gitlab CI job.

## Usage

The image can be used as a base for your Gitlab CI jobs in order to run all the pre-commit checks defined in the configuration file.

```
image:
  name: "Around25/docker-precommit-base"

stages:
  - code_check

code_check:
  stage: code_check
  variables:
  script:
    # install precommit check
    - pre-commit install
    # optionally install dependencies
    - go get github.com/fzipp/gocyclo
    - go get -u golang.org/x/lint/golint
    - curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.22.2
    # run the check 
    - pre-commit run --all-files
```
