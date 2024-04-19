#!/bin/sh
rm -rf docs/* \
	&& mkdir -p docs \
	&& mkdir -p docs/pure-seminar \
	&& echo "Folder structure creation successful."
pandoc -s content/index.md -o docs/index.html \
	&& pandoc -s content/pure-seminar.md -o docs/pure-seminar/index.html \
	&& echo "Site generation successful."
