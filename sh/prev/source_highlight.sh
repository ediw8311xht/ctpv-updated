# text: source-highlight

# shellcheck disable=SC2154
source-highlight                    \
	--tab=4 --out-format=esc        \
	--style=esc256.style --failsafe \
	-i "${f}"
