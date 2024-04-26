# Pure functions

str_add () {
    # Usage: str_add A B
    # Returns: "A:B" if A does not contain B, else returns A
    if [ -z "$1" ]; then
        printf "$2"
    elif ! printf "$1" | /bin/grep -E -q "(^|:)${2}($|:)"; then
        printf "${1}:${2}"
    else
        printf "${1}"
    fi
}

collect_files () {
    # Usage: collect_files CONTENT_DIR
    # Returns: a ':' separated list of markdown files in CONTENT DIR
    outp=
    for f_name in $(find "$1" -mindepth 1 -type f -name '*.md'); do
        outp=$(str_add "$outp" "$f_name")
    done
    printf "$outp"
}

get_out_path () {
    # Usage: get_out_path FILE SUBSTITUTION
    # Returns: The output path of FILE according to SUBSTITUTION
    printf "$1" | sed -E "$2;s|md$|html|"
}

# Non-pure functions

_clean () {
    # Usage: _clean DIR
    # Remove all files in DIR
    find "$1" -mindepth 1 -delete
}

_make_dirs () {
    # Usage: _make_dirs FILE_LIST SUBSTITUTION
    # Given a list of files, create output directories for those files according to SUBSTITUTION
    OIFS="$IFS"
    IFS=":"
    for f_name in $1; do
        d_name=$(dirname $f_name | sed -E "$2")
        mkdir -p "${d_name}"
    done
    IFS="$OIFS"
}

_render_file () {
    # Usage: _render FILE SUBSTITUTION
    # Renders FILE as HTML
    # Assumes that FILE exists and the corresponding output directories have been created

    outfile="$(get_out_path $1 $2)"
    pandoc -s --mathml "$1" -o "$outfile"
}

_render_site () {
    # Usage: _render_site FILE_LIST SUBSTITUTION
    # Given a list of files, render each of them
    OIFS="$IFS"
    IFS=":"
    for f_name in $1; do
        _render_file "${f_name}" "$2"
    done
    IFS="$OIFS"
}

_copy_assets () {
    # Usage: _copy_assets DIRS_LIST OUTP_DIR
    # Given a list of asset directories copy them into the output directory
    OIFS="$IFS"
    IFS=":"
    for d_name in $1; do
        cp -r "${d_name}" "${2}/"
        cp "archetypes/redirect_home.html" "${2}/${d_name}/index.html"
    done
    IFS="$OIFS"
}
