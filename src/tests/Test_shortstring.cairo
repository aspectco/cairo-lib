%lang starknet
%builtins pedersen range_check ecdsa

from starkware.cairo.common.uint256 import Uint256
from src.cairolib.shortstring import felt_to_ss, uint256_to_ss

@view
func test_felt_to_ss{range_check_ptr}(value: felt) -> (res_len: felt, res: felt*):
    return felt_to_ss(value)
end

@view
func test_uint256_to_ss{range_check_ptr}(value: Uint256) -> (res_len: felt, res: felt*):
    return uint256_to_ss(value)
end

