redo-phony
. $TEST_LIB

assert_cmd() {
	assert which $1
}

assert_cmd redo
assert_cmd redo-ifchange
assert_cmd redo-ifcreate
assert_cmd redo-phony
assert_cmd redo-always
assert_cmd redo-graph
assert_cmd redo-targets
assert_cmd redo-sources
assert_cmd redo-clean
assert_cmd redo-gc
assert_cmd redo-tmp
