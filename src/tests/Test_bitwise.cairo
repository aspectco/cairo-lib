%lang starknet
%builtins pedersen range_check ecdsa

from src.cairolib.bitwise import bitshift_right, bitshift_left

@view
func test_bitshift_right{range_check_ptr}(word: felt, num_bits: felt) -> (shifted: felt):
    return bitshift_right(word, num_bits)
end

@view
func test_bitshift_left{range_check_ptr}(word: felt, num_bits: felt) -> (shifted: felt):
    return bitshift_left(word, num_bits)
end

