const SimpleVoting = artifacts.require("SimpleVoting");

contract("SimpleVoting", function(accounts) {

    let contract;

    beforeEach(async function() {
        contract = await SimpleVoting.deployed();
    });

    it("should add a candidate", async function() {
        const candidateName = "Candidate A";
        await contract.addCandidate(candidateName);
        const candidateCount = await contract.candidatesCount();
        assert.equal(candidateCount, 1);
    });

    it("should allow voting", async function() {
        const candidateIndex = 0;
        await contract.vote(candidateIndex, { from: accounts[0] });
        const candidate = await contract.getCandidateByIndex(0);
        const voteCount = candidate.voteCount;
        assert.equal(voteCount, 1);
    });

    it("should determine the winning candidate", async function() {
        const candidateName = "Candidate B";
        await contract.addCandidate(candidateName);
        await contract.vote(1, { from: accounts[1] });
        await contract.vote(1, { from: accounts[3] });
        const winningCandidate = await contract.getWinningCandidate();
        assert.equal(winningCandidate, candidateName);
    });
});