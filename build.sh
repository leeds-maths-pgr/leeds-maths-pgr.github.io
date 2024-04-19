#!/bin/sh
rm -rf docs/* \
	&& mkdir -p docs \
	&& mkdir -p docs/pure \
	&& mkdir -p docs/applied \
	&& mkdir -p docs/statistics \
	&& echo "Folder structure creation successful."
pandoc -s content/index.md -o docs/index.html \
	&& pandoc -s content/pure/index.md -o docs/pure/index.html \
	&& echo "Site generation successful."
	#&& pandoc -s content/applied.md -o docs/applied/index.html \
	#&& pandoc -s content/statistics.md -o docs/statistics/index.html \
