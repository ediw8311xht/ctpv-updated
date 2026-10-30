# epub: gnome-epub-thumbnailer

# shellcheck disable=SC2154
epub() {
  a="$((w*h))"
  gnome-epub-thumbnailer -s "${a}" "${f}" "${cache_f}"
}

convert_and_show_image "${@}"

