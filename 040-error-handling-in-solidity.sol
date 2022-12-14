// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Error Handling in Solidity
 * @notice Solidity has functions that help in error handling
 * @dev A way of tackling this is that when an error happens, the state reverts back to its original state. 
    Below are some of the important methods for error handling:

    assert(bool condition) − In case condition is not met, this method call causes an 
    invalid opcode and any changes done to state got reverted. This method is to be used for internal errors.

    require(bool condition) − In case condition is not met, this method call reverts to original state. 
    - This method is to be used for errors in inputs or external components.

    require(bool condition, string memory message) − In case condition is not met, this method call reverts to original state. 
    - This method is to be used for errors in inputs or external components. It provides an option to provide a custom message.

    revert() − This method aborts the execution and revert any changes done to the state.

    revert(string memory reason) − This method aborts the execution and revert any changes done to the state. 
    It provides an option to provide a custom message.
 */

contract LearnErrorHandling {
    bool public sunny = true;
    bool public umbrella = false;
    uint256 finalCalc = 0;

    // solar panel machine
    function solarCalc() public {
        // it should be sunny
        // require(sunny);
        require(sunny, "It is not sunny today!");
        finalCalc += 3;
    }

    function internalTestUnits() public view {
        assert(finalCalc != 6);
    }

    // machine that controls the weather
    function weatherChange() public {
        sunny = false;
    }

    // get finalCalc value
    function getCalc() public view returns (uint256) {
        return finalCalc;
    }

    // determine if user should bring an unbrella
    // or not
    function bringUmbrella() public {
        if (!sunny) {
            umbrella = true;
        } else {
            revert("No need to bring an umbrella today!");
        }
    }
}

contract Vendor {
    address seller;

    // modifier to let the msg.sender be the seller
    modifier onlySeller() {
        require(msg.sender == seller, "Only the seller can sell this!");
        _;
    }

    // function to sell --only if you are the seller
    function sell(uint256 amount) public payable onlySeller {
        if (amount > msg.value) {
            // revert the contract if the funds in msg.sender is smaller
            // than the requested amount or price of the good.
            revert("There is not enought Ether provided!");
        }
    }
}
