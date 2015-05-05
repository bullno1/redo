redo-phony
. `dirname $0`/test.sh
SCRIPT_DIR=$(readlink -f $(dirname $0))
PWD=`pwd`
assert [ "$SCRIPT_DIR" = "$PWD" ]
