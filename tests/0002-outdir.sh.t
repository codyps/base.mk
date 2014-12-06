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

	make O=x

	assert_file_exists x/test
	assert_file_exists x/test.o
}