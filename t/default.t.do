redo-phony

TEST_NAME=${1%.t}
if [ ! -f "$TEST_NAME/test.do" ]; then
	redo-log -1 "$TEST_NAME is not a testcase"
	exit 1
fi

TEST_DIR=`redo-tmp`
rm -rf "$TEST_DIR"
cp -r "$TEST_NAME" "$TEST_DIR"
export TEST_LIB=`readlink -f test.sh`
$(cd "$TEST_DIR" && unset REDO && redo test)
