##
# Leeds PGR Website
#
# @file
# @version 0.1

html:
	mkdir -p html
	./build.sh -o html

serve:
	cd html && python -m http.server

darkserve:
	cd html && darkhttpd . --port 8000

.PHONY: html serve
# end
