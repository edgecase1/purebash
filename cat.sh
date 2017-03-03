
cat_file() {
    #while read line; do printf '%s\n' "$line" ; done <$1
    printf '%s' "$(<$1)"
}


cat_with_linenr() {
    linenumber=1
    while read line; do 
        printf '%3d: %s\n' $linenumber "$line"
        ((linenumber++))
    done <$1
}
