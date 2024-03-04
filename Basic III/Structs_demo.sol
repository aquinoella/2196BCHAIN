// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructsDemo {
    struct Person {
        string name;
        uint256 age;
    }

    Person public myPerson;

    function setPerson(string memory _name, uint256 _age) external {
        myPerson = Person(_name, _age);
    }

    function getPerson() external view returns (string memory, uint256) {
        return (myPerson.name, myPerson.age);
    }
}
