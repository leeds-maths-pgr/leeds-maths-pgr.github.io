#!/bin/sh
rm -rf site/* \
	&& mkdir -p site \
	&& mkdir -p site/pure-seminar \
	&& echo "Folder structure creation successful."
pandoc -s content/index.md -o site/index.html \
	&& pandoc -s content/pure-seminar.md -o site/pure-seminar/index.html \
	&& echo "Site generation successful."
