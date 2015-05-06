redo-phony
. $TEST_LIB
mkdir -p $REDO_META_DIR/tmp
LOG="$REDO_META_DIR/tmp/log"
redo 2>&1 | tee $LOG 1>&2
# No self dependency
assert [ ! -f "$REDO_DB_DIR/rel/rel_target/.redo/prereqs/rel/rel_target" ]
# Verify targets' contents
assert_equal '`cat all`' '`cat rel/rel_source`'
assert_equal '`cat rel/rel_source`' '`cat rel/rel_target`'
assert_equal '`cat rel_source`' '`cat rel/rel_target2`'
assert_equal '`cat rel/rel_source`' '`cat rel_target`'
PREREQ_SHA1=`cat "$REDO_DB_DIR/rel/rel_target/.redo/prereqs/rel/rel_source"`
CORRECT_SHA1=`sha1sum "rel/rel_source" | cut -d' ' -f1`
assert_equal '$CORRECT_SHA1' '$PREREQ_SHA1'
# Check how the build was logged
assert_equal 1 '`grep "redo rel/rel_target$" "$LOG" | wc -l`'
assert_equal 1 '`grep "redo rel/rel_target2$" "$LOG" | wc -l`'
assert_equal 1 '`grep "redo rel_target$" "$LOG" | wc -l`'
NUM_SRCS=`redo-sources | grep rel_source | wc -l`
assert_equal 2 '$NUM_SRCS'
# Can we rebuild?
redo 2>&1 | tee $LOG 1>&2
