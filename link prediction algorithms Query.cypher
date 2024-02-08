MATCH (p1:Person {name: 'Hank'}), (p2:Person {name: 'Jack'})
WITH p1, p2
RETURN 
    gds.alpha.linkprediction.adamicAdar(p1, p2) AS AdamicAdar,
    gds.alpha.linkprediction.commonNeighbors(p1, p2) AS CommonNeighbors,
    gds.alpha.linkprediction.preferentialAttachment(p1, p2) AS PreferentialAttachment,
    gds.alpha.linkprediction.resourceAllocation(p1, p2) AS ResourceAllocation,
    gds.alpha.linkprediction.sameCommunity(p1, p2) AS SameCommunity,
    gds.alpha.linkprediction.totalNeighbors(p1, p2) AS TotalNeighbors
