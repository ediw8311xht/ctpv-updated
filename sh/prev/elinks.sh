# html: elinks

# shellcheck disable=SC2154
elinks                  \
	-dump 1             \
    -dump-width "${w}"  \
	-no-references      \
    -no-numbering       \
    < "${f}"
