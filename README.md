# custom-go-linters
Temporary repo to test out custom golang linters being in their own repo

## Table of Contents

<!-- Table of Contents auto-generated with `pre-commit` and `markdown-toc` -->
<!-- Regenerate with "pre-commit run -a markdown-toc" -->

<!-- toc -->


<!-- tocstop -->

## Usage

1. Clone repo to be next to the mymove repo.
2. Build plugin:

    ```shell
    go build -buildmode=plugin -o ../mymove/ plugin/custom_go_linters.go
    ```
3. Run `golangci-lint` in other repo
