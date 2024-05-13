# Leeds Maths PGR Website

[![GitHub Pages Deployment](https://github.com/leeds-maths-pgr/leeds-maths-pgr.github.io/actions/workflows/static.yml/badge.svg)](https://github.com/leeds-maths-pgr/leeds-maths-pgr.github.io/actions/workflows/static.yml)

This holds the content for the Mathematics PGR site at the University of Leeds and handles the site upload via GitHub actions.

## Updating the website

You can update the website either by editing the content on GitHub directly, or by cloning the repository and pushing your changes.
Creating a local copy will allow you to preview your changes before deploying them.
**Before you can make any changes**, you will need to become a member of the [leeds-maths-pgr](https://github.com/leeds-maths-pgr) organisation.
Please see that webpage for details.

### Working on the site locally

1. (on first run only) Run `git clone git@github.com:leeds-maths-pgr/leeds-maths-pgr.github.io`.
1. `cd leeds-maths-pgr.github.io` and `git pull` to merge changes.
1. Make changes to the markdown files in the `content` folder.
   See [below](#previewing-changes) for information on how to locally preview changes.
1. Once you're happy with your changes, `git add` and `git commit`.
1. `git push`

The site is built and deployed automatically upon `git push` to `main`, it should not take more than one minute.

#### Previewing changes

If you have a copy of python accessible from your path, you can use its in-built http server to preview changes.
Alternatively, if you prefer not to use python, you can use [`darkhttpd`](https://unix4lyfe.org/darkhttpd/).
This has been added to a Makefile for your convenience; run:
- `make html` to set up the local directories and locally build the site
- `make serve` to run the local python http server, if you have python installed
- `make darkserve` to run the local `darkhttpd` server, if you have `darkhttpd` installed

The preview of the site should then be available at [http://localhost:8000/](http://localhost:8000/)

### Uploading assets

Place any static assets (e.g. PDFs or images) in the [`assets`](./assets/) directory, they can then be linked to from the content document.
For example, if you wanted to link to `assets/Georg_Friedrich_Bernhard_Riemann.jpeg`, you would write `[link text](/assets/Georg_Friedrich_Bernhard_Riemann.jpeg)`.
Do take note of the leading `/` in the URL above, it is important!
