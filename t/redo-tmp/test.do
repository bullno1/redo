redo-phony
. $TEST_LIB

TEMP_DIR1=`redo-tmp`
assert_equal test '`basename $TEMP_DIR1`'
assert [ -d $TEMP_DIR1 ]
TEMP_DIR2=`redo-tmp asdf`
assert_equal asdf '`basename $TEMP_DIR2`'
assert [ -d $TEMP_DIR2 ]
assert_equal '$(readlink -f $TEMP_DIR1)/asdf' '$(readlink -f $TEMP_DIR2)'

touch $TEMP_DIR1/tmp_file
redo different
