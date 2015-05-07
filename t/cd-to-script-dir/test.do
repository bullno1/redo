redo-phony
. $TEST_LIB
SCRIPT_DIR=$(readlink -f $(dirname $0))
PWD=`pwd`
assert [ "$SCRIPT_DIR" = "$PWD" ]
