// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract MQuizContract{
    address public owner;
    uint256 public age;
    uint256 public hoursWorked;
    uint256 public hourlyRate;
    uint256 public totalsalary;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only contract owner can call this funstion");
        _;
    }


    constructor() {
        owner = msg.sender;
    }
     function setage(uint256 _age) public onlyOwner {
        age = _age; 
    }

    function setHourlyRate(uint256 _hourlyRate) public onlyOwner {
        require(_hourlyRate > 0, "Hourly rate must be larger than zero");
        hourlyRate = _hourlyRate; 
    }
    function setHoursWorked(uint256 _hoursWorked)
    public onlyOwner {
        require(_hoursWorked > 0, "Hours worked must be greater than zero");
        hoursWorked = _hoursWorked;
    }

    function CalculatorTotSal()
    public onlyOwner returns (uint256)  {
        require(hourlyRate > 0 && hoursWorked > 0, "Hourly Rate and hours worked must be greater than zero");
        totalsalary = hourlyRate * hoursWorked;
        return totalsalary;
    }
    }
