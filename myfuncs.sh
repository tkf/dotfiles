hgs-start(){
    if [ ! -d ~/tmp/log/ ]; then
	echo "~/tmp/log/ not found"
	return 1
    fi
    {cd $1 && \
	hg serve -p $2 \
	--accesslog ~/tmp/hgs-access-$2.log \
	--errorlog ~/tmp/hgs-error-$2.log}
}

shs-start()
{
    if [ ! -d ~/tmp/log/ ]; then
	echo "~/tmp/log/ not found"
	return 1
    fi
    {cd $1 && \
	python -m SimpleHTTPServer $2 \
	> ~/tmp/log/simple-http-server-${HOST}-$2.log 2>&1}
}

screen-hgs-start()
{
    screennum=10
    if [ $# -eq 3 ]; then
	screensnum=$3
    elif [ $# -ne 2 ]; then
	echo "Need three or two arguments."
	return 1
    fi
    {cd $1 && screen -t hgs $screensnum hg serve -p $2}&
}

screen-shs-start()
{
    screennum=10
    if [ $# -eq 3 ]; then
	screensnum=$3
    elif [ $# -ne 2 ]; then
	echo "Need three or two arguments."
	return 1
    fi
    {cd $1 && screen -t shs $screensnum python -m SimpleHTTPServer $2}&
}

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
