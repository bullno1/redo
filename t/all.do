redo-phony

TESTS=`find . -mindepth 2 -maxdepth 2 -name 'test.do' -type f -printf '%h.t\n'`
set +e
STATUS=0

for i in $TESTS
do
	redo-log "Running testcase ${i%.t}"
	redo "$i" || status=1
done

exit $STATUS
