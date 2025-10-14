// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRegistry {
    address public owner;
    struct Student {
        string name;
        uint age;
        bool isRegistered;
    }
    mapping(address => Student) studentList;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can register a new student.");
        _;
    }

    event studentRegister(address indexed user, string name, uint age);

    function register(address user, string memory _name, uint _age) public onlyOwner {
        studentList[user] = Student(_name, _age, true);
        emit studentRegister(user, _name, _age);
    }

    function getStudent(address user) public view returns(string memory, uint) {
        return (studentList[user].name, studentList[user].age);
    }

    function isStudentRegistered(address user) public view returns(bool) {
        return studentList[user].isRegistered;
    }
}