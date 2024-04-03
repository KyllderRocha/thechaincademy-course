pragma solidity ^0.8.0;

contract SimpleVoting {
  struct Candidate {
    string name;
    uint256 voteCount;
  }

  mapping(address => bool) public hasVoted;
  Candidate[] public candidates;

  function addCandidate(string memory _name) public {
    candidates.push(Candidate(_name, 0));
  }

  function vote(uint256 candidateIndex) public {
    require(!hasVoted[msg.sender], "Already voted");
    hasVoted[msg.sender] = true;
    candidates[candidateIndex].voteCount++;
  }

  function getCandidateByIndex(uint256 _index) public view returns (Candidate memory) {
    require(_index < candidates.length, "index out");
    return candidates[_index];
  }

  function getWinningCandidate() public view returns (string memory) {
    uint256 winningIndex = 0;
    for (uint256 i = 1; i < candidates.length; i++) {
      if (candidates[i].voteCount > candidates[winningIndex].voteCount) {
        winningIndex = i;
      }
    }
    return candidates[winningIndex].name;
  }

  function candidatesCount() public view returns (uint256) {
    return candidates.length;
  }

}
