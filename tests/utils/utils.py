def felt_to_str(felt):
    length = (felt.bit_length() + 7) // 8
    return felt.to_bytes(length, byteorder="big").decode("utf-8")

def uint256_to_int(uint256):
    return uint256[0] + uint256[1]*2**128

def uint256(val):
    return (val & 2**128-1, (val & (2**256-2**128)) >> 128)

