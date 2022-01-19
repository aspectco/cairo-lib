import pytest
import random

from utils.generate import generate_random_felt_list, generate_random_uint256_list
from utils.utils import felt_to_str, uint256_to_int, uint256


@pytest.mark.asyncio
@pytest.mark.parametrize("value", generate_random_felt_list())
async def test_felt_to_ss(test_shortstring, value):
    execution_info = await test_shortstring.test_felt_to_ss(value).call()
    res_str = ""
    for r in execution_info.result.res:
        res_str += felt_to_str(r)

    assert res_str == str(value)
    assert int(res_str) == value


@pytest.mark.asyncio
@pytest.mark.parametrize("value", generate_random_uint256_list())
async def test_uint256_to_ss(test_shortstring, value):
    execution_info = await test_shortstring.test_uint256_to_ss(value).call()
    final_res = ""
    for r in execution_info.result.res:
        final_res += felt_to_str(r)

    assert int(final_res) == uint256_to_int(value)
    assert final_res == str(uint256_to_int(value))
    assert uint256(int(final_res)) == value

