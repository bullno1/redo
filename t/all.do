redo-phony

TESTS=`find . -mindepth 2 -maxdepth 2 -name 'test.do' -type f -printf '%h.t\n'`
STATUS=0

for i in $TESTS
do
	redo-log "Running testcase ${i%.t}"
	redo "$i" || STATUS=1
done

exit $STATUS
