# Symfony LTS Helper

This package is intended for projects that want to stay on the **latest Symfony LTS version**.

It is especially useful when you do **not** use `symfony/flex`, but still want reliable dependency updates that keep your Symfony stack aligned with the current LTS line.

## Why this package exists

Keeping Symfony dependencies on the latest LTS can be harder without the tooling and recipes provided by Flex.

This package provides a practical way to express and enforce LTS-oriented dependency constraints so your project remains on the supported LTS track.

## Dependabot workaround

A primary goal of this package is to act as a workaround for Dependabot auto-update workflows.

By using this package, Dependabot can resolve updates in a way that is compatible with a latest-LTS policy, reducing manual intervention in pull requests.

See this issue for more information:
https://github.com/dependabot/dependabot-core/issues/4631

## Usage

Add this package to your project dependencies, then run your regular Composer update process (locally, in CI, or through Dependabot PRs).

Composer commands:

```bash
composer require "gared/symfony-lts:^7.4" # for Symfony 7.4 LTS
composer require "gared/symfony-lts:^6.4" # for Symfony 6.4 LTS
composer update
```