// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArraysDemo {
    uint256[] public numbers;

    function addNumber(uint256 _number) external {
        numbers.push(_number);
    }

    function getNumber(uint256 _index) external view returns (uint256) {
        require(_index < numbers.length, "Index out of bounds");
        return numbers[_index];
    }

    function getArrayLength() external view returns (uint256) {
        return numbers.length;
    }
}