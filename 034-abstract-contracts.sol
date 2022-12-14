// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Abstract Contracts
 * @notice Abstract contracts is one which contains a least one
 *         function without any implementation.
 *
 * Generally an abstract contract contains both implemented
 * and abstract functions.
 *
 * Derived contract will implement the abstract function and use
 * the existing functions as they are and when required.
 *
 * Here we talk of two things
 * 1. base contract and
 * 2. the derived contract
 */

// this will act as out base contract
abstract contract LearnMoreOnEvents {
    // since the function has no implementation we can mark it as virtual
    function sendMessage() public view virtual returns (string memory) {}
}

// derived contract
contract DerivedContract is LearnMoreOnEvents {
    // overriding the method within the base contract
    function sendMessage() public pure override returns (string memory) {
        return "Hello World!";
    }
}

// technically the contract is still abstract since it has atleast one
// funtion without an implementation.
contract Member {
    string name;
    uint256 age = 25;

    function setName() public virtual returns (string memory) {}

    function getAge() public view returns (uint256) {
        return age;
    }
}

// derived contract
contract Teacher is Member {
    function setName() public override pure returns (string memory) {
        return "TheUnicornDev237";
    }
}
