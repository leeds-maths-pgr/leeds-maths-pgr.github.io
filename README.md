# README

[![Deploy static content to Pages](https://github.com/leeds-maths-pgr/leeds-maths-pgr.github.io/actions/workflows/static.yml/badge.svg)](https://github.com/leeds-maths-pgr/leeds-maths-pgr.github.io/actions/workflows/static.yml)

## How to update the website

1. Run `git clone git@github.com:leeds-maths-pgr/leeds-maths-pgr.github.io`.
2. `cd leeds-maths-pgr.github.io`
3. Make changes to the markdown files in the `content` folder.
4. Once you're happy with your changes, `git add` and `git commit`.
5. `git push`

That's it! No need to run the `build.sh` script on your machine because I've set up a "Github action" to do that automatically.
The site is built and deployed automatically upon `git push`, and it should not take more than one minute.
