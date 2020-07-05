### ethplorer

## About

ethplorer is R package that is used to query the Ethereum blockchain using the Ethplorer API. This package is not affiliated with Ethplorer.io. API calls have been limited to 0.25 seconds per call to prevent overloading Ethplorer's server.

## Installation

To install the development version, you need to run the following code:

```r
devtools::install_github("dtyk/ethplorer")
```
## Examples

The `getTopTokenHolders` function queries the top holders of a given token and returns a data frame of the results

```r
> getTopTokenHolders("0x514910771af9ca656af840dff83e8264ecf986ca")
[1] "Querying Ethplorer API....."
                              holders.address holders.balance holders.share
1  0x98c63b7b319dfbdf3d811530f2ab9dfe4983af9d    3.500000e+26         35.00
2  0xbe0eb53f46cd790cd13851d5eff43d12404d33e8    5.275415e+25          5.28
3  0x75398564ce69b7498da10a11ab06fd8ff549001c    5.000000e+25          5.00
4  0xe0362f7445e3203a496f6f8b3d51cbb413b69be2    5.000000e+25          5.00
5  0x5560d001f977df5e49ead7ab0bdd437c4ee3a99e    5.000000e+25          5.00
6  0xbe6977e08d4479c0a6777539ae0e8fa27be4e9d6    5.000000e+25          5.00
7  0xdad22a85ef8310ef582b70e4051e543f3153e11f    3.740000e+25          3.74
8  0xf37c348b7d19b17b29cd5cfa64cfa48e2d6eb8db    3.109042e+25          3.11
9  0xf977814e90da44bfa03b6295a0616a897441acec    1.000000e+25          1.00
10 0x3dfd23a6c5e8bbcfc9581d2e864a68feb6a076d3    7.699281e+24          0.77
```
## Author
David Tan
