redo-phony
. $TEST_LIB

TEMP_DIR=`redo-tmp`
assert [ -d "$TEMP_DIR1" ]
assert [ ! -f "$TEMP_DIR1/tmp_file" ]
