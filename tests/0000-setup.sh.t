run_test () {
	yes "" | ${DIR}/bin/base.mk-import >/dev/null
	assert_file_exists base.mk
	assert_file_not_exist base-ccan.mk
}
