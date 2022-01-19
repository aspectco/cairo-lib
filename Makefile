# Build and test
build :; nile compile
test  :; pytest tests/

test-bitwise :; pytest tests/test_bitwise.py -s -v
test-array :; pytest tests/test_array.py -s -v
test-shortstring :; pytest tests/test_shortstring.py -s -v

test-temp :; pytest tests/test_shortstring.py -s -v -k test_ss_to_felt


