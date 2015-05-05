assert() {
	set +e
	$*
	local status=$?
	if [ $status -ne 0 ]; then
		redo-log "$* -> $status"
	fi
	return $status
}
