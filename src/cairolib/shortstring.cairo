from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.math import unsigned_div_rem
from starkware.cairo.common.pow import pow
from starkware.cairo.common.uint256 import Uint256, uint256_unsigned_div_rem, uint256_eq

func felt_to_ss{range_check_ptr}(value: felt) -> (res_len: felt, res: felt*):
    alloc_locals
    let (local res) = alloc()

    if value == 0:
        assert res[0] = 48
        return (res_len=1, res=res)
    end

    let (res_len) = _felt_to_ss(value, res)
    return (res_len=res_len, res=res)
end

func _felt_to_ss{range_check_ptr}(value: felt, res: felt*) -> (res_len: felt):
    alloc_locals
    if value == 0:
        return (res_len=0)
    end

    let (running_total, remainder) = _felt_to_ss_partial(value, 0)
    let (res_len) = _felt_to_ss(remainder, res)
    assert res[res_len] = running_total
    return (res_len=res_len+1)
end

func _felt_to_ss_partial{range_check_ptr}(
    value: felt,
    depth: felt
    ) -> (running_total: felt, remainder: felt):
    alloc_locals

    let (local word_exponent) = pow(2, 8*depth)

    let (q, r) = unsigned_div_rem(value, 10)
    if q == 0:
        let res = word_exponent * (r + 48)
        return (running_total=res, remainder=q)
    end
    if depth == 30:
        let res = word_exponent * (r + 48)
        return (running_total=res, remainder=q)
    end

    let (running_total, remainder) = _felt_to_ss_partial(q, depth + 1)
    let res = word_exponent * (r + 48) + running_total
    return (running_total=res, remainder=remainder)
end

func uint256_to_ss{range_check_ptr}(value: Uint256) -> (res_len: felt, res: felt*):
    alloc_locals

    let (local res) = alloc()

    let (value_eq) = uint256_eq(value, Uint256(0, 0))
    if value_eq == 1:
        assert res[0] = 48
        return (res_len=1, res=res)
    end

    let (res_len) = _uint256_to_ss(value, res)
    return (res_len=res_len, res=res)
end

func _uint256_to_ss{range_check_ptr}(value: Uint256, res: felt*) -> (res_len: felt):
    alloc_locals

    let (value_eq) = uint256_eq(value, Uint256(0, 0))
    if value_eq == 1:
        return (res_len=0)
    end

    let (local running_total, remainder) = _uint256_to_ss_partial(value, 0)
    let (res_len) = _uint256_to_ss(remainder, res)
    assert res[res_len] = running_total
    return (res_len=res_len+1)
end

func _uint256_to_ss_partial{range_check_ptr}(
    value: Uint256,
    depth: felt
    ) -> (running_total: felt, remainder: Uint256):
    alloc_locals

    let (local word_exponent) = pow(2, 8*depth)

    let (q, r) = uint256_unsigned_div_rem(value, Uint256(10, 0))
    assert r.high = 0
    let (quotient_eq) = uint256_eq(q, Uint256(0, 0))
    if quotient_eq == 1:
        let res = word_exponent * (r.low + 48)
        return (running_total=res, remainder=q)
    end
    if depth == 30:
        let res = word_exponent * (r.low + 48)
        return (running_total=res, remainder=q)
    end

    let (running_total, remainder) = _uint256_to_ss_partial(q, depth + 1)
    let res = word_exponent * (r.low + 48) + running_total
    return (running_total=res, remainder=remainder)
end

