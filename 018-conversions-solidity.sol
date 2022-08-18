// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * Conversions - datatypes
 */

contract LearnConversions {
    // uint defaults to 256;
    // uint cannot take negative numbers
    // has a maximum value of 2^256 - 1
    // minimum value of 0
    uint256 data;

    // how to be specific to reduce gas rates in solidity
    // when working with smart contracts

    // converting to a lower type costs higher order bits
    uint32 a = 0x12345678;
    uint256 b = uint16(a); // b = 0x5678

    // converting yo higher type adds padding bits to the left
    uint16 c = 0x1234;
    uint32 d = uint32(c);
}
