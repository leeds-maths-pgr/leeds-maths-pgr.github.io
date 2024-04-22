# README

[![Deploy static content to Pages](https://github.com/leeds-maths-pgr/leeds-maths-pgr.github.io/actions/workflows/static.yml/badge.svg)](https://github.com/leeds-maths-pgr/leeds-maths-pgr.github.io/actions/workflows/static.yml)

## Updating the website

You can update the website either by editing the content on GitHub directly, or by cloning the repository and pushing your changes.
Creating a local copy will allow you to preview your changes before deploying them.
Before you can make any changes, you will need to become a member of the [leeds-maths-pgr](https://github.com/leeds-maths-pgr) organisation.
Please see that webpage for details.

### Working on the site locally

1. Run `git clone git@github.com:leeds-maths-pgr/leeds-maths-pgr.github.io`.
1. `cd leeds-maths-pgr.github.io`.
   If it's not your first rodeo, then `git pull` and deal with the changes.
1. Make changes to the markdown files in the `content` folder.
   See [below](#previewing-changes) for information on how to locally preview changes.
1. Once you're happy with your changes, `git add` and `git commit`.
1. `git push`

That's it! No need to run the `build.sh` script on your machine because I've set up a "Github action" to do that automatically.
The site is built and deployed automatically upon `git push`, and it should not take more than one minute. Therefore...

***DO NOT edit the `www` folder! Any changes made to it will be overwritten by the build script...***

#### Previewing changes

If you have a copy of python accessible from your path you can use its in-built http server to preview changes.
This has been added to a Makefile for your convenience, run:
- `make html` to set up the local directories and locally build the site
- `make serve` to run the local http server

The preview of the site should then be available at [http://localhost:8000/](http://localhost:8000/)
