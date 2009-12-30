cfunc-def () {
    funcname=$1
    source=$2
    maxline=1000
    grep -A ${maxline} "${funcname}[^[:alnum:]_]" $source | grep -m 1 -B ${maxline} "^}"
}

cfunc-diff() {
    tmp_file1=`mktemp cfunc-diff.XXXXXXXXXX` || return 1
    tmp_file2=`mktemp cfunc-diff.XXXXXXXXXX` || {
	rm -f $tmp_file1; return 1
    }
    cfunc-def $1 $2 > $tmp_file1
    cfunc-def $1 $3 > $tmp_file2
    diff -p $tmp_file1 $tmp_file2
    rm -f $tmp_file2
    rm -f $tmp_file1
}
