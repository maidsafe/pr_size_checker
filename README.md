# PR Size Checker

| [MaidSafe website](https://maidsafe.net) | [SAFE Dev Forum](https://forum.safedev.org) | [SAFE Network Forum](https://safenetforum.org) |
|:-------------------------------------:|:---------------------------------------:|:------------------------------------------:|

## Overview

A GitHub Action which checks the number of additions and deletions made in each submitted PR, adding them together to come up with a `total lines changed` value, then checking whether this value exceeds the default or set `max_lines_changed` value. If it does exceed then the CI job will exit with code 1, i.e. fail.

Calculation:
```
Total lines changed = lines added + lines deleted
```

## Inputs

| Name                | Description                                                                                                           | Required | Default |
| ------------------- | --------------------------------------------------------------------------------------------------------------------- | -------- | ------- |
| `max_lines_changed` | The maximum number of total changes you want to allow in this repository. By default, this will be 200.               | true     | `200`   |

## Usage

Here is an example of what to put in your `.github/workflows/pr.yml` file, or a separate `.github/workflows/pr_size_check.yml` file to trigger the action.

```yaml
name: PR Size Checker
on: pull_request
jobs:
  check_pr_size:
    name: Check PR size doesn't break set limit
    runs-on: ubuntu-latest
    steps:
      # checkout your code with your git history
      - uses: actions/checkout@v2
        with:
          fetch-depth: 0
      - uses: maidsafe/pr_size_checker@v1.1
        with:
          max_lines_changed: 200
```

## License

This GitHub Action is dual-licensed under the Modified BSD ([LICENSE-BSD](LICENSE-BSD) https://opensource.org/licenses/BSD-3-Clause) or the MIT license ([LICENSE-MIT](LICENSE-MIT) http://opensource.org/licenses/MIT) at your option.

## Contributing

Want to contribute? Great :tada:

There are many ways to give back to the project, whether it be writing new code, fixing bugs, or just reporting errors. All forms of contributions are encouraged!

For instructions on how to contribute, see our [Guide to contributing](https://github.com/maidsafe/QA/blob/master/CONTRIBUTING.md).
