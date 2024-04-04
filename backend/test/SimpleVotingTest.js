const SimpleVoting = artifacts.require("SimpleVoting");

contract("SimpleVoting", function(accounts) {

    let contract;

    beforeEach(async function() {
        contract = await SimpleVoting.deployed();
    });

    // Test case to ensure that a candidate can be added
    it("should add a candidate", async function() {
        const candidateName = "Candidate A";
        await contract.addCandidate(candidateName);
        const candidateCount = await contract.candidatesCount();
        assert.equal(candidateCount, 1);
    });

    // Test case to ensure that a voter can vote for a candidate
    it("should allow voting", async function() {
        const candidateIndex = 0;
        await contract.vote(candidateIndex, { from: accounts[0] });
        const candidate = await contract.getCandidateByIndex(0);
        const voteCount = candidate.voteCount;
        assert.equal(voteCount, 1);
    });

    // Test case to ensure that the winning candidate can be determined
    it("should determine the winning candidate", async function() {
        // Add a new candidate
        const candidateName = "Candidate B";
        await contract.addCandidate(candidateName);

        // Vote for the candidate multiple times
        await contract.vote(1, { from: accounts[1] });
        await contract.vote(1, { from: accounts[3] });

        // Check the winning candidate
        const winningCandidate = await contract.getWinningCandidate();
        assert.equal(winningCandidate, candidateName);
    });
});