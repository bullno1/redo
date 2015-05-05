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
	set +e
	local status=0

	local test_scripts=`find t -mindepth 1 -maxdepth 1 -name '*.do' -type f`

	for i in $test_scripts
	do
		redo ${i%.do} || status=1
	done

	return $status
}

main $*
