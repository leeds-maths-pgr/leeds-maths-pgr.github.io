#!/usr/bin/env sh

. "./utility.sh"

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

while getopts "i:o:ch" OPTION; do
        case $OPTION in

                o)
                        oflag="true"
                        DIR_OUTP="$OPTARG";;

                c)
                        cflag="true";;

                c)
                        DIR_CONT="$OPTARG";;

                h)
                        echo "Usage:"
                        echo "args.sh -h "
                        echo "args.sh [-ic] -o OUTPDIR "
                        echo ""
                        echo "   -o OUTPDIR      Set the output directory"
                        echo "   -i INPTDIR      Set the input directory. Default value is 'content'"
                        echo "   -c              Do not build the site and just exit after cleaning the output directory"
                        echo "   -h              help (this output)"
                        exit 0
                        ;;

        esac
done

if [ -z "$oflag" ]; then
    echo "ERR: Output directory not specified."
    echo "Please specify an output directory using the flag '-o OUTPDIR'"
    exit 1
fi

# Generic sed command that needs to be passed to other functions
SUBSTITUTION="s|${DIR_CONT}|${DIR_OUTP}|"

mkdir -p "${DIR_OUTP}"
_clean "${DIR_OUTP}"
if [ ! -z "$cflag" ]; then
    exit 0
fi
LST_FILE="$(collect_files ${DIR_CONT})"
_make_dirs "$LST_FILE" "$SUBSTITUTION"
_render_site "${LST_FILE}" "$SUBSTITUTION"
