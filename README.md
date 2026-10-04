# Parallex for Homebrew

The Homebrew cask for [Parallex](https://parallex.mandip.dev), which runs
separate instances of Mac apps side by side.

```sh
brew install --cask mandipadk/parallex/parallex
```

That taps this repository and, on Homebrew 6 and later, trusts only the
Parallex cask from it. If you'd rather tap first:

```sh
brew tap mandipadk/parallex
brew trust --cask mandipadk/parallex/parallex
brew install --cask parallex
```

Tapped Parallex before from `github.com/mandipadk/parallex`? That repository
isn't public any more, so `brew update` can't reach it. Point the tap here once
(Parallex stays installed), and `brew update` carries on as before:

```sh
brew tap --custom-remote mandipadk/parallex https://github.com/mandipadk/homebrew-parallex
git -C "$(brew --repository mandipadk/parallex)" reset --hard origin/main
```

Parallex updates itself after that (signed updates, checked against the key
built into the app). The cask downloads releases from
[parallex.mandip.dev/releases](https://parallex.mandip.dev/releases) and checks
them against the checksum in the cask.

The `parallex` command comes inside the app, at
`Parallex.app/Contents/Resources/parallex`, and the cask links it onto your
PATH. Installed Parallex some other way? **Settings › About › Install** in the
app does the same. There's no separate formula for the command any more:
`brew install mandipadk/parallex/parallex` (without `--cask`) won't find one.

Something wrong with the cask, or a question about Parallex? Open an issue in
[parallex-community](https://github.com/mandipadk/parallex-community/issues).
