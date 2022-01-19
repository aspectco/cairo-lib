import random

from utils.utils import uint256

MAX_RANGE_CHECK_BOUND = 2**128 - 1

def random_int_list(minimum=0, maximum=None, size=None):
    if maximum is None:
        maximum = random.randint(0, 2**251-1)
    if size is None:
        size = random.randint(0, 50)
    res = []
    for i in range(size):
        res.append(random.randint(minimum, maximum))
    return res

def generate_random_felt_list():
    return  list(range(0, 11)) + \
        random.sample(range(10, 99), 5) + \
        random.sample(range(100, 9999), 5) + \
        random.sample(range(10000, 999990), 5) + \
        random_int_list(int("1"*32), MAX_RANGE_CHECK_BOUND, 5) + \
        [MAX_RANGE_CHECK_BOUND]

def generate_random_uint256_list():
    random_felt_list = generate_random_felt_list()
    return [uint256(i) for i in random_felt_list] + \
        [uint256(i) for i in random_int_list(2**128, 2**256, 5)] + \
        [uint256(2**256-1)]

