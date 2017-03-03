
_doit() {
    #echo $1
    if [ -u "$path" ] ; then echo $1 ; fi # suid binaries 
}


recurse() {  
    if [ ! -d "$1" ] ; then return ; fi
    for i in $1/* ; do
	path=${i//\/\//\/} # replace all double slashes
        _doit "$path"
	# dont follow symbolic links
	if [ -L "$path" ] ; then continue ; fi
	# recurse down dirs
        if [ -d "$path" ] ; then recurse "$path" ; fi
    done
}    

recurse $1
