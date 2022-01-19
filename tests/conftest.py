import pytest
import asyncio

from starkware.starknet.testing.starknet import Starknet
from utils.constants import FPATH_TEST_BITWISE, FPATH_TEST_ARRAY, FPATH_TEST_SHORTSTRING

@pytest.fixture(scope="module")
def event_loop():
    return asyncio.new_event_loop()

"""Use global starknet instance."""
@pytest.fixture(scope="module")
async def starknet():
    return await Starknet.empty()

@pytest.fixture(scope="module")
async def test_bitwise(starknet):
    bitwise = await starknet.deploy(
        FPATH_TEST_BITWISE,
        constructor_calldata=[],
    )
    return bitwise

@pytest.fixture(scope="module")
async def test_array(starknet):
    array = await starknet.deploy(
        FPATH_TEST_ARRAY,
        constructor_calldata=[],
    )
    return array

@pytest.fixture(scope="module")
async def test_shortstring(starknet):
    array = await starknet.deploy(
        FPATH_TEST_SHORTSTRING,
        constructor_calldata=[],
    )
    return array

