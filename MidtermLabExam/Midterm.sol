// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

    contract GradeContract {

    struct  Student {
    string name;
    uint256 preliminaryGrade;
    uint256 midtermGrade;
    uint256 finalGrade;
    GradeStatus status;
}

    enum GradeStatus { Pass, Fail }

    mapping(address => Student) students;
    address owner;


    modifier onlyOwner() {
    require(msg.sender == owner, "Only the owner can call this function");
    _;
}

    modifier validGrade(uint256 _grade) {
    require(_grade >= 0 && _grade <= 100, "Grade must be between 0 and 100");
    _;
}


    event GradeComputed(string name, GradeStatus status);
    receive() external payable { }


    constructor() {
    owner = msg.sender;
}


    function setScore(string calldata _name) 
    public onlyOwner {
    students[msg.sender].name = _name;
}

    function setPreliminaryGrade(uint256 _grade) 
    public onlyOwner validGrade(_grade) {
    students[msg.sender].preliminaryGrade = _grade;
}

    function setMidtermGrade(uint256 _grade) 
    public onlyOwner validGrade(_grade) {
    students[msg.sender].midtermGrade = _grade;
}

    function setFinalGrade(uint256 _grade) 
    public onlyOwner validGrade(_grade) {
    students[msg.sender].finalGrade = _grade;
}

    function calculateGrade() public onlyOwner {
    Student storage student = students[msg.sender];
    uint256 overallGrade = (student.preliminaryGrade + student.midtermGrade + student.finalGrade) / 3;

    if (overallGrade >= 50) {
    student.status = GradeStatus.Pass;
} else {
    student.status = GradeStatus.Fail;
}

    emit GradeComputed(student.name, student.status);
}
}