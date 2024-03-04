// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Destructuring {
    function destructuringAssignment() external pure returns (uint256, uint256) {
        (uint256 x, uint256 y) = (10, 20);
        return (x, y);
    }
}