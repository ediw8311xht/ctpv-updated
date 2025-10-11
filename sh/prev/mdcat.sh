# markdown: mdcat

# shellcheck disable=SC2154
MDCAT_PAGER= PAGER=cat mdcat -p -l --columns "${w}" -- "${f}"
