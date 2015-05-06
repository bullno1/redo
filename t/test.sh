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

instrument_redo() {
	local redo_path=`which redo`
	if [ "$redo_path" = "$REDO" ]; then
		redo-log "Can't instrument redo"
		exit 1
	fi

	local redo_cmds=$(find $(dirname $redo_path) -type l)
	for i in $redo_cmds
	do
		rm $i
		echo "#!/bin/sh" > $i
		local cmd_name=`basename $i`
		local flag=
		if [ "$cmd_name" != "redo" ]; then
			flag="--${cmd_name#redo-}"
		fi
		echo "exec $REDO $flag \$*" >> $i
		chmod +x $i
	done
}

if [ ! -z "$INSTRUMENT_REDO" ]; then
	instrument_redo $INSTRUMENT_REDO
fi
