%lang starknet
%builtins pedersen range_check ecdsa

from src.cairolib.array import arr_concat, arr_eq

@view
func test_arr_concat{range_check_ptr}(
    a_len: felt,
    a: felt*,
    b_len: felt,
    b: felt*,
    ) -> (res_len: felt, res: felt*):
    return arr_concat(a_len, a, b_len, b)
end

@view
func test_arr_eq(
    a_len: felt,
    a: felt*,
    b_len: felt,
    b: felt*,
    ) -> (res: felt):
    return arr_eq(a_len, a, b_len, b)
end

