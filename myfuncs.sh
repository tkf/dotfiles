md(){
    mkdir -v "$@"
    cd "$1"
}

path2url(){
    while getopts u:p: OPT
    do
	case $OPT in
	    "u" ) FLG_URL_BASE="TRUE" ; URL_BASE="$OPTARG" ;;
	    "p" ) FLG_PATH_BASE="TRUE" ; PATH_BASE="$OPTARG" ;;
	    * ) echo "Usage: path2url [-u URL] [-p PATH] files ..." 1>&2
		return 1 ;;
	esac
    done
    shift `expr $OPTIND - 1`
    if [ "$FLG_URL_BASE" != "TRUE" ]; then
	URL_BASE="http://localhost"
    fi
    if [ "$FLG_PATH_BASE" != "TRUE" ]; then
	PATH_BASE=`pwd`
    fi
    CWD=`pwd`
    for hfile in "$@"
    do
	echo "${URL_BASE}/${CWD#$PATH_BASE}/${hfile}"
    done
}

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
	screennum=$3
    elif [ $# -ne 2 ]; then
	echo "Need three or two arguments."
	return 1
    fi
    {cd $1 && screen -t hgs $screennum hg serve -p $2}&
}

screen-shs-start()
{
    screennum=10
    if [ $# -eq 3 ]; then
	screennum=$3
    elif [ $# -ne 2 ]; then
	echo "Need three or two arguments."
	return 1
    fi
    {cd $1 && screen -t shs $screennum python -m SimpleHTTPServer $2}&
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

npwd () {
    if [ "${1}" ]
    then
	dlen=${1}
    else
	dlen=1
    fi
    cwd=`pwd`
    pad=`for i in \`seq ${dlen}\`; do cd ..; done; pwd`
    echo ${cwd#${pad}/}
}

loop-qstat-grep-and-rec (){
    regexp=$1
    recpath=$2
    interval=$3
    while [ -n "`qstat | grep \"${regexp}\"`" ]
    do
	qstat | grep "${regexp}" > ${recpath}
	sleep ${interval}
    done
    qstat | grep ${regexp} > ${recpath}
}

when-jobs-end (){
    regexp=$1
    interval=$2
    while [ -n "`qstat | grep \"${regexp}\"`" ]
    do
	sleep ${interval}
    done
}

