from starkware.cairo.common.memcpy import memcpy
from starkware.cairo.common.alloc import alloc

func arr_concat{range_check_ptr}(
    a_len: felt,
    a: felt*,
    b_len: felt,
    b: felt*,
    ) -> (res_len: felt, res: felt*):
    alloc_locals
    let (local a_cpy: felt*) = alloc()

    memcpy(a_cpy, a, a_len)
    memcpy(a_cpy + a_len, b, b_len)

    return (a_len + b_len, a_cpy)
end

func arr_eq(a_len: felt, a: felt*, b_len: felt, b: felt*) -> (res: felt):
    if a_len != b_len:
        return (0)
    end
    if a_len == 0:
        return (1)
    end
    return _arr_eq(a_len=a_len, a=a, b_len=b_len, b=b, current_index=a_len-1)
end

func _arr_eq(a_len: felt, a: felt*, b_len: felt, b: felt*, current_index: felt) -> (res: felt):
    if current_index == -1:
        return (1)
    end
    if a[current_index] != b[current_index]:
        return (0)
    end
    return _arr_eq(a_len=a_len, a=a, b_len=b_len, b=b, current_index=current_index-1)
end

