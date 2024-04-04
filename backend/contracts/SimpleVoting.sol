// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title SimpleVoting
 * @dev Smart contract for conducting a simple voting process.
 */
contract SimpleVoting {
    // Struct to represent a candidate
    struct Candidate {
        string name; // Name of the candidate
        uint256 voteCount; // Number of votes received by the candidate
    }

    // Array to store the list of candidates
    Candidate[] public candidates;

    // Mapping to keep track of whether an address has voted
    mapping(address => bool) public hasVoted;

    /**
     * @dev Function to add a new candidate to the list
     * @param _name The name of the candidate to be added
     */
    function addCandidate(string memory _name) public {
        candidates.push(Candidate(_name, 0));
    }

    /**
     * @dev Function to allow an address to vote for a candidate
     * @param candidateIndex The index of the candidate in the candidates array
     */
    function vote(uint256 candidateIndex) public {
        require(!hasVoted[msg.sender], "Already voted");
        hasVoted[msg.sender] = true;
        candidates[candidateIndex].voteCount++;
    }

    /**
     * @dev Function to get the details of a candidate by index
     * @param _index The index of the candidate in the candidates array
     * @return The details of the candidate (name and vote count)
     */
    function getCandidateByIndex(uint256 _index) public view returns (Candidate memory) {
        require(_index < candidates.length, "Index out of bounds");
        return candidates[_index];
    }

    /**
     * @dev Function to determine the winning candidate
     * @return The name of the winning candidate
     */
    function getWinningCandidate() public view returns (string memory) {
        uint256 winningIndex = 0;
        for (uint256 i = 1; i < candidates.length; i++) {
            if (candidates[i].voteCount > candidates[winningIndex].voteCount) {
                winningIndex = i;
            }
        }
        return candidates[winningIndex].name;
    }

    /**
     * @dev Function to get the total number of candidates
     * @return The total number of candidates
     */
    function candidatesCount() public view returns (uint256) {
        return candidates.length;
    }
}
