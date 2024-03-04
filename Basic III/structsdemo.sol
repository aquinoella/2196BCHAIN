// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructsArrayDemo {
    struct Person {
        string name;
        uint256 age;
    }

    Person[] public people;

    function addPerson(string memory _name, uint256 _age) external {
        people.push(Person(_name, _age));
    }

    function getPerson(uint256 _index) external view returns (string memory, uint256) {
        require(_index < people.length, "Index out of bounds");
        Person memory p = people[_index];
        return (p.name, p.age);
    }

    function getPeopleCount() external view returns (uint256) {
        return people.length;
    }
}