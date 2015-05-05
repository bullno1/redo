redo-phony # Only use default.do for phony targets

main() {
	case $1 in
		test)
			do_tests
			;;
		*)
			redo-log -1 "No build script for '$1'"
			exit 1
			;;
	esac
}

do_tests() {
	export TEST_LIB=`readlink -f t/test.sh`
	set +e
	local status=0

	local test_scripts=`find t -mindepth 1 -maxdepth 1 -name '*.do' -type f`
	for i in $test_scripts
	do
		redo ${i%.do} || status=1
	done

	mkdir -p "$REDO_META_DIR/tmp"
	local test_dirs=`find t -mindepth 1 -maxdepth 1 -type d`
	for i in $test_dirs
	do
		local test_name=${i#t/}
		redo-log "Running $test_name"
		# TODO: Use	`redo-tmp`
		local test_dir="$REDO_META_DIR/tmp/$test_name"
		rm -rf "$test_dir"
		cp -r "$i" "$test_dir"
		$(cd "$test_dir" && unset REDO && redo test) || status=1
	done

	return $status
}

main $*
