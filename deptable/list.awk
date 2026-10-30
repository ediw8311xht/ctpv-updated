#!/usr/bin/gawk -f

function perr(str) {
    printf "%s: %s\n", ARGV[0], str > "/dev/stderr"
}

function join(arr, sep,   res, s) {
    for (i in arr) {
        res = res s arr[i]
        if (s == "")
            s = sep
    }

    return res
}

function process_file(file,   i, line, arr, t, p, p_len) {
    i = getline line < file

    if (i == -1) {
        perr(ERRNO ": " file)
        exit
    } else if (i == 0) {
        return
    }

    if (match(line, /^#\s*([a-zA-Z0-9_-]+):\s*(.*)/, arr) == 0)
        return

    t = arr[1]
    p_len = split(arr[2], p, /\s+/)
    for (i = 1; i <= p_len; i++) {
        types[t][types_len[t]++] = LINKS[p[i]] ? sprintf("[%s][%s]", p[i], p[i]) : p[i]
    }
}

BEGIN {
    LINKS["atool"]                  = "https://www.nongnu.org/atool/"
    LINKS["chafa"]                  = "https://github.com/hpjansson/chafa"
    LINKS["colordiff"]              = "https://www.colordiff.org/"
    LINKS["delta"]                  = "https://github.com/dandavison/delta"
    LINKS["diff-so-fancy"]          = "https://github.com/so-fancy/diff-so-fancy"
    LINKS["elinks"]                 = "http://elinks.cz/"
    LINKS["exiftool"]               = "https://github.com/exiftool/exiftool"
    LINKS["ffmpeg"]                 = "https://ffmpeg.org/"
    LINKS["ffmpegthumbnailer"]      = "https://github.com/dirkvdb/ffmpegthumbnailer"
    LINKS["fontforge"]              = "https://fontforge.org"
    LINKS["glow"]                   = "https://github.com/charmbracelet/glow"
    LINKS["gnome-epub-thumbnailer"] = "https://gitlab.gnome.org/GNOME/gnome-epub-thumbnailer"
    LINKS["gpg"]                    = "https://www.gnupg.org/"
    LINKS["highlight"]              = "https://gitlab.com/saalen/highlight"
    LINKS["imagemagick"]            = "https://imagemagick.org/"
    LINKS["jq"]                     = "https://github.com/jqlang/jq"
    LINKS["libreoffice"]            = "https://www.libreoffice.org/"
    LINKS["lynx"]                   = "https://github.com/jpanther/lynx"
    LINKS["mdcat"]                  = "https://github.com/swsnr/mdcat"
    LINKS["poppler"]                = "https://poppler.freedesktop.org/"
    LINKS["source-highlight"]       = "https://www.gnu.org/software/src-highlite/"
    LINKS["transmission"]           = "https://transmissionbt.com/"
    LINKS["ueberzug"]               = "https://github.com/seebye/ueberzug"
    LINKS["w3m"]                    = "https://w3m.sourceforge.net/"

    for (i = 1; i < ARGC; i++)
        process_file(ARGV[i])

    for (t in types)
        s = s sprintf("%s\t%s\n", t, join(types[t], " "))

    printf "%s", s | "sort"
    close("sort")

    print ""
    for (k in LINKS) {
        if (!LINKS[k])
            continue
        printf ">\t%s\t%s\n", k, LINKS[k]
    }
}
