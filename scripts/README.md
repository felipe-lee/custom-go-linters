# Scripts

This directory holds the scripts that are not compiled go code. For
compiled go code please look in the `bin/` directory of the project.

If you want to see if scripts are not listed in this file you can run
`find-scripts-missing-in-readme`.

<!-- Table of Contents auto-generated with `pre-commit` and `markdown-toc` -->
<!-- Regenerate with "pre-commit run -a markdown-toc" -->

<!-- toc -->


<!-- tocstop -->

## Dev Environment

These scripts are primarily used for managing the developers
environment.

| Script Name            | Description                                          |
| ---------------------- | ---------------------------------------------------- |
| `check-go-version`     | checks the go version required for the project |
| `check-gopath`         | checks the go path is correct for the project  |
| `install_tools`        | installs all prerequisites and sets up the shell file |

## Pre-commit Scripts

These scripts are used primarily to check our code before
committing.

| Script Name                   | Description                                                       |
| ----------------------------- | ------------------------------------------------------------------|
| `pre-commit-go-mod`           | modify `go.mod` and `go.sum` to match whats in the project        |
