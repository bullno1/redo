redo-phony
. $TEST_LIB
mkdir -p $REDO_META_DIR/tmp
LOG="$REDO_META_DIR/tmp/log"
redo 2>&1 | tee $LOG 1>&2
assert_equal '`cat all`' '`cat rel/rel_source`'
assert_equal '`cat rel/rel_source`' '`cat rel/rel_target`'
assert_equal '`cat rel_source`' '`cat rel/rel_target2`'
assert_equal '`cat rel/rel_source`' '`cat rel_target3`'
assert_equal 1 '`grep "redo rel/rel_target$" "$LOG" | wc -l`'
assert_equal 1 '`grep "redo rel/rel_target2$" "$LOG" | wc -l`'
assert_equal 1 '`grep "redo rel_target3$" "$LOG" | wc -l`'
NUM_SRCS=`redo-sources | grep rel_source | wc -l`
assert_equal 2 '$NUM_SRCS'
