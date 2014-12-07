#! /bin/sh
set -eu

error () {
	touch "$T_ERROR"
	echo "ERROR: $B_TEST in $T_DIR: $*" >>/dev/stderr
}

assert () {
	local msg=$1
	shift
	if ! "$@" ; then
		error "$msg"
	fi
}

assert_file_exists () {
	assert "file $1 does not exist" [ -e "$1" ]
}

assert_file_not_exist () {
	assert "file $1 exists" [ ! -e "$1" ]
}
