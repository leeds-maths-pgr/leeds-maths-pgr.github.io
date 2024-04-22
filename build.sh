#!/usr/bin/env sh

source "./utility.sh"

# Globals

DIR_CONT="content"
DIR_OUTP=
LST_FILE=


# Options
if [ $# -eq 0 ]; then
        echo "ERR: No options provided"
        echo "(run $0 -h for help)"
        echo ""
        exit 1
fi

oflag=
cflag=

while getopts "o:ch" OPTION; do
        case $OPTION in

                o)
                        oflag="true"
                        DIR_OUTP="$OPTARG";;

                c)
                        cflag="true";;

                h)
                        echo "Usage:"
                        echo "args.sh -h "
                        echo "args.sh [-c] -o OUTPDIR "
                        echo ""
                        echo "   -o OUTPDIR      Run the script writing the generated output to OUTPDIR"
                        echo "   -c              Do not build the site and just exit after cleaning the output directory"
                        echo "   -h              help (this output)"
                        exit 0
                        ;;

        esac
done

if [ -z "$oflag" ]; then
    echo "ERR: Output directory not specified.\nPlease specify an output directory using the flag '-o OUTPDIR'"
    exit 1
fi

# Generic sed command that needs to be passed to other functions
SUBSTITUTION="s|${DIR_CONT}|${DIR_OUTP}|"

_clean "${DIR_OUTP}"
if [ ! -z "$cflag" ]; then
    exit 0
fi
LST_FILE="$(collect_files ${DIR_CONT})"
_make_dirs "$LST_FILE" "$SUBSTITUTION"
_render_site "${LST_FILE}" "$SUBSTITUTION"
