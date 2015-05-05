redo-phony
TESTS=`find t -mindepth 1 -maxdepth 1 -name '*.do' -type f`
set +e
STATUS=0
for i in $TESTS
do
	test_name=${i%.do}
	redo "$test_name" || STATUS=1
done
[ $STATUS -eq 0 ] && redo-log "All tests passed"
exit $STATUS
