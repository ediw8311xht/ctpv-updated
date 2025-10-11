# any: exiftool cat

# shellcheck disable=SC2154
if exists exiftool; then
	exiftool -- "${f}" || true
else
	cat < "${f}"
fi
