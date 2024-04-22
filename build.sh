#!/bin/sh
rm -rf docs/* \
	&& mkdir -p www \
	&& mkdir -p www/pure \
	&& mkdir -p www/applied \
	&& mkdir -p www/statistics \
	&& echo "Folder structure creation successful."
pandoc -s content/index.md -o www/index.html \
	&& pandoc -s content/pure/index.md -o www/pure/index.html \
	&& echo "Site generation successful."
	#&& pandoc -s content/applied.md -o www/applied/index.html \
	#&& pandoc -s content/statistics.md -o www/statistics/index.html \
