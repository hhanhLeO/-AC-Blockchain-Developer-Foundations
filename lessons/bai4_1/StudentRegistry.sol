// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRegistry {
    struct Student {
        string name;
        uint age;
        bool isRegistered;
    }
    mapping(address => Student) public studentList;

    function register(string memory _name, uint _age) public {
        studentList[msg.sender] = Student(_name, _age, true);
    }

    function getStudent(address user) public view returns(string memory, uint) {
        return (studentList[user].name, studentList[user].age);
    }

    function isStudentRegistered(address user) public view returns(bool) {
        return studentList[user].isRegistered;
    }
}