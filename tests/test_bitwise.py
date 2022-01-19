import pytest
import random

from utils.generate import random_int_list

@pytest.mark.asyncio
@pytest.mark.parametrize("word", random_int_list(0, 2**64-1, 10) + [0, 2**64-1])
@pytest.mark.parametrize("num_bits", list(random.sample(range(0, 64), 10)))
async def test_bitshift_right(test_bitwise, word, num_bits):
    expected_shifted = word >> num_bits
    execution_info = await test_bitwise.test_bitshift_right(word, num_bits).invoke()
    assert execution_info.result.shifted == expected_shifted

@pytest.mark.asyncio
@pytest.mark.parametrize("word", random_int_list(0, 2**64-1, 10) + [0, 2**64-1])
@pytest.mark.parametrize("num_bits", list(random.sample(range(0, 64), 10)))
async def test_bitshift_left(test_bitwise, word, num_bits):
    expected_shifted = (word << num_bits) & (2**64 - 1)
    execution_info = await test_bitwise.test_bitshift_left(word, num_bits).invoke()
    assert execution_info.result.shifted == expected_shifted

