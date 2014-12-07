#! /bin/sh
run_test () {
	yes "" | ${DIR}/bin/base.mk-import >/dev/null
	assert_file_exists base.mk
	assert_file_not_exist base-ccan.mk

	cat >Makefile <<EOF
TARGET_BIN = test
obj-test = test.o
include base.mk
EOF

	cat >test.c <<EOF
int main(void)
{
	return 0;
}
EOF

	mkdir x
	make O=x VARIANTS="v1 v2"

	assert_file_exists x/v1/test
	assert_file_exists x/v1/test.o
	assert_file_exists x/v2/test
	assert_file_exists x/v2/test.o
}
