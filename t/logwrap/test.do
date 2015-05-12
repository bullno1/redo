redo-phony
. $TEST_LIB
LOG="`redo-tmp`/log"
redo 2>&1 | tee $LOG 1>&2
assert_equal 1 '`grep ": aasdfasdf" "$LOG" | wc -l`'
