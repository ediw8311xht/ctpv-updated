# text: highlight

# shellcheck disable=SC2154
highlight \
	--replace-tabs=4 --out-format=ansi \
	--style='pablo' --force -- "${f}"
