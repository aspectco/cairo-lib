import pytest
import random
import copy

from utils.generate import random_int_list

@pytest.mark.asyncio
@pytest.mark.parametrize("a", [[], random_int_list(), random_int_list(), random_int_list()])
@pytest.mark.parametrize("b", [[], random_int_list(), random_int_list(), random_int_list()])
async def test_arr_concat(test_array, a, b):
    execution_info = await test_array.test_arr_concat(a, b).call()
    assert execution_info.result.res == (a + b)

@pytest.mark.asyncio
@pytest.mark.parametrize("arr", [[], random_int_list(), random_int_list(), random_int_list()])
async def test_arr_eq_eq(test_array, arr):
    execution_info = await test_array.test_arr_eq(arr, arr).call()
    assert execution_info.result.res == 1

@pytest.mark.asyncio
@pytest.mark.parametrize("arr", [[], random_int_list(), random_int_list(), random_int_list()])
async def test_arr_eq_not_eq(test_array, arr):
    diff_arr = random_int_list()
    execution_info = await test_array.test_arr_eq(arr, diff_arr).call()
    assert execution_info.result.res == 0

    diff_size_arr = random_int_list(size=len(arr) + 1)
    execution_info = await test_array.test_arr_eq(arr, diff_size_arr).call()
    assert execution_info.result.res == 0

