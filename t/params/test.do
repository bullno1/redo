redo-phony
. $TEST_LIB
redo --a=b --b=c a
assert_equal '"b"' '`cat a`'
redo-ifchange --a=b --b=c b
assert_equal '"c"' '`cat b`'
redo-ifchange --a=b --b=c "no-inherit"
assert_equal '""' '`cat child`'
redo --c=d --e=f
assert_equal '"df"' '`cat all`'
