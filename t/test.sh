assert() {
	set +e
	$*
	local status=$?
	if [ $status -ne 0 ]; then
		redo-log "$* -> $status"
	fi
	return $status
}

assert_equal() {
	eval "EXPECTED=$1"
	eval "ACTUAL=$2"
	if [ "$ACTUAL" = "$EXPECTED" ]; then
		return 0
	else
		redo-log -2 "$1 != $2 (expected: $EXPECTED, got: $ACTUAL)"
		return 1
	fi
}
