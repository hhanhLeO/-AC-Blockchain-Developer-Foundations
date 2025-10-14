// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Candidate {
        string name;
        uint voteCount;
    }
    mapping(uint => Candidate) public candidates;
    mapping(address => bool) public hasVoted;

    address owner;
    uint public candidateCount = 0;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action.");
        _;
    }

    event Voted(address voter, uint candidateId);

    function addCandidate(string memory _name) public onlyOwner {
        candidates[++candidateCount] = Candidate(_name, 0);
    }

    function vote(uint candidateId) public {
        require(!hasVoted[msg.sender], "You have voted.");
        require(candidateId <= candidateCount, "Invalid candidate id.");

        candidates[candidateId].voteCount++;
        hasVoted[msg.sender] = true;
        emit Voted(msg.sender, candidateId);
    }
}