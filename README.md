![cairo-lib logo](./assets/cairo-lib-logo.png)

#### Libraries for Cairo development.

## Library

```
lib
├─ array — array functions such as concatenation and equality.
├─ bitwise — bitwise left and right shift
├─ shortstring — transformations such as felt/int256 -> short string
```

## Installation and Usage

To install with pip

```sh
pip install cairolib
```

Example .cairo file

```
from cairolib.array import arr_concat
from cairolib.shortstring import uint256_to_ss

let (token_uri_len, token_uri) = arr_concat(
    base_token_uri_len,
    base_token_uri,
    token_id_ss_len,
    token_id_ss,
)

let (token_id_ss_len, token_id_ss) = uint256_to_ss(token_id)

```

<!-- To install with [**Hardhat**](https://github.com/nomiclabs/hardhat) or [**Truffle**](https://github.com/trufflesuite/truffle):

```sh
npm install cairo-lib
``` -->

## Safety

This is **experimental software** and is provided on an "as is" and "as available" basis.

These **methods are NOT audited** and are **not designed with user safety** in mind:

We **do not give any warranties** and **will not be liable for any loss** incurred through any use of this codebase.

## Acknowledgements

These contracts were inspired by or directly modified from many sources, primarily:

- [StarkWare](https://github.com/starkware-libs/cairo-lang)
- [starknet-l2-storage-verifier](https://github.com/OilerNetwork/starknet-l2-storage-verifier)
