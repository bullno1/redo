redo-phony
. $TEST_LIB
redo
assert [ `cat all` = `cat rel/rel_source` ]
NUM_SRCS=`redo-sources | grep rel_source | wc -l`
assert_equal 2 '$NUM_SRCS'
