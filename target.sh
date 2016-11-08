#!/bin/sh
file="$1"
docname=$(echo $1 | sed 's/.md$//')

cat <<EOF > Makefile.target
md		= ${file}
docname = ${docname}
EOF

make

