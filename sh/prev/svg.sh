# svg: convert

# shellcheck disable=SC2154
svg() {
	magick convert "${f}" "jpg:${cache_f}"
}

convert_and_show_image svg
