<div align="center">
  <p>
    Let's introduce Relational Link Prediction Algorithms on Graph Database 
  </p>
  <img src="https://sattari.org/wp-content/uploads/2024/02/ScreenRecording2024-02-08at03.17.20-ezgif.com-video-to-gif-converter-1-copy-3.gif" alt="Cover Image" style="max-width:100%; max-height:300px; pointer-events: none;">
</div>



# ⚛︎ Graph Database Creation in Neo4j 

To create your database you can use this Cypher Query. **nodes** + **relationships** 

```ruby
// Person nodes
CREATE (alice:Person {name: 'Alice', gender: 'Female', age: 30, bornIn: 'New York'}),
       (bob:Person {name: 'Bob', gender: 'Male', age: 32, bornIn: 'London'}),
       (carol:Person {name: 'Carol', gender: 'Female', age: 25, bornIn: 'Sydney'}),
       (dave:Person {name: 'Dave', gender: 'Male', age: 28, bornIn: 'Toronto'}),
       (eve:Person {name: 'Eve', gender: 'Female', age: 22, bornIn: 'Paris'}),
       (frank:Person {name: 'Frank', gender: 'Male', age: 35, bornIn: 'Berlin'}),
       (grace:Person {name: 'Grace', gender: 'Female', age: 29, bornIn: 'Tokyo'}),
       (hank:Person {name: 'Hank', gender: 'Male', age: 40, bornIn: 'Cape Town'}),
       (irene:Person {name: 'Irene', gender: 'Female', age: 24, bornIn: 'Moscow'}),
       (jack:Person {name: 'Jack', gender: 'Male', age: 27, bornIn: 'Rio de Janeiro'})

// Pets
CREATE (rocky:Pet {name: 'Rocky', species: 'Dog', breed: 'Golden Retriever'}),
       (bella:Pet {name: 'Bella', species: 'Cat', breed: 'Siamese'}),
       (max:Pet {name: 'Max', species: 'Parrot', breed: 'Macaw'}),
       (lucy:Pet {name: 'Lucy', species: 'Rabbit', breed: 'Holland Lop'})

// Products
CREATE (smartphone:Product {name: 'Smartphone', brand: 'TechBrand'}),
       (laptop:Product {name: 'Laptop', brand: 'CompTech'}),
       (book:Product {name: 'Book', title: 'The Great Adventure'})

// Activities
CREATE (jogging:Activity {name: 'Jogging', fact: 'Can increase lifespan by 3 years'}),
       (painting:Activity {name: 'Painting', fact: 'Improves mental health and creativity'}),
       (cooking:Activity {name: 'Cooking', fact: 'Is a form of therapeutic art'})

// relationships
CREATE (alice)-[:MARRIED_TO {MarriedOn: '2020-02-25'}]->(bob),
       (bob)-[:DIVORCED_FROM {DivorcedOn: '2023-09-02'}]->(alice),
       (carol)-[:SURPRISED]->(dave),
       (eve)-[:OWNS]->(rocky),
       (frank)-[:OWNS]->(bella),
       (grace)-[:OWNS]->(max),
       (hank)-[:OWNS]->(lucy),
       (irene)-[:FRIENDS_WITH {since: '2021-09-19'}]->(jack),
       (jack)-[:MARRIED_TO]->(irene),
       (alice)-[:BOUGHT]->(smartphone),
       (bob)-[:BOUGHT]->(laptop),
       (carol)-[:READS]->(book),
       (dave)-[:PARTICIPATES_IN]->(jogging),
       (eve)-[:PRACTICES]->(painting),
       (frank)-[:ENJOYS]->(cooking),
       (grace)-[:USES]->(smartphone),
       (hank)-[:WORKS_ON]->(laptop),
       (irene)-[:STUDIES]->(book),
       (jack)-[:EXERCISES_WITH]->(jogging),
       (max)-[:CARED_FOR_BY]->(grace),
       (lucy)-[:PLAYS_WITH]->(jack),
       (laptop)-[:NEEDED_FOR]->(cooking),
       (jogging)-[:LIKED_BY]->(hank),
       (painting)-[:CHOSEN_BY]->(carol),
       (cooking)-[:LEARNED_BY]->(alice),
       (hank)-[:FRIENDS_WITH]->(jack)
RETURN *
```
<br>

This Cypher Query is accessible by [database creation Query.cypher](/Database%20Creation%20Query.cypher) 

<br>

## Query to Show the Graph:

```ruby
match (n) return n
```

<div align="center">
    <img src="https://sattari.org/wp-content/uploads/2024/02/Screenshot-2024-02-08-at-03.19.22-1024x640.png" alt="Common Neighbors Formula" width="700" />
</div>

# ⛓🖇 Link Prediction Algorithms  

## Adamic-Adar Algorithm

The Adamic-Adar algorithm was introduced in 2003 by Lada Adamic and Eytan Adar. It's designed to predict links in a social network by measuring the closeness between pairs of nodes. The algorithm calculates the similarity between nodes based on the commonality of their connections, using the following formula:

<div align="center">
    <img src="Images/Adamic Adar.png" alt="Adamic-Adar Formula" width="300" />
</div>

The formula essentially sums the inverse logarithm of the degree of common neighbors between two nodes. Here, `N(u)` represents the set of nodes adjacent to node `u`. A computed value of 0 indicates that two nodes are not close, suggesting no common neighbors, while higher values signify a closer relationship, indicating multiple shared connections.

### Key Points:

- **Purpose:** Predicts the likelihood of a future link between two nodes in a social network.
- **Interpretation:** A higher Adamic-Adar score implies a stronger relationship or connection likelihood between the nodes based on their shared neighbors.
- **Usage:** The library provides a function to calculate the closeness between two nodes.


## Common Neighbors Algorithm

The Common Neighbors algorithm is based on the premise that two nodes (individuals) that share a mutual friend or connection are more likely to be introduced than those without any mutual connections. This concept is fundamental in social network analysis for predicting potential links.

<div align="center">
    <img src="Images/Common Neighbors.png" alt="Common Neighbors Formula" width="300" />
</div>

The formula counts the number of shared neighbors between two nodes, where `N(x)` and `N(y)` represent the sets of nodes adjacent to nodes `x` and `y`, respectively. A computed value of 0 signifies no common neighbors, whereas higher values indicate a stronger connection due to multiple shared neighbors.

### Key Points:

- **Purpose:** Identifies potential connections between two nodes based on mutual acquaintances.
- **Interpretation:** Higher values suggest a higher likelihood of forming a connection.
- **Usage:** Function available in the library to calculate mutual connections.

## Preferential Attachment Algorithm

Preferential Attachment reflects the principle that the more connections a node has, the more likely it is to acquire new connections. This concept was popularized by Albert-László Barabási and Réka Albert and is crucial for understanding the growth of scale-free networks.

<div align="center">
    <img src="Images/Preferential Attachment.png" alt="Preferential Attachment Formula" width="300" />
</div>

The formula calculates the product of the degrees (number of connections) of two nodes, indicating that nodes with higher degrees are more likely to connect. `|N(u)|` and `|N(v)|` denote the degrees of nodes `u` and `v`, respectively.

### Key Points:

- **Purpose:** Predicts the formation of new links between nodes based on existing connections.
- **Interpretation:** Higher values indicate a greater potential for link formation.
- **Usage:** Function available in the library for assessing potential link formation.

## Resource Allocation Algorithm

Introduced in 2009 by Tao Zhou, Linyuan Lü, and Yi-Cheng Zhang, the Resource Allocation algorithm is a link prediction measure that simulates how resources would be distributed through shared neighbors between two nodes.

<div align="center">
    <img src="Images/Resource Allocation.png" alt="Resource Allocation Formula" width="300" />
</div>

This algorithm sums the inverse of the degree of common neighbors, similar to the Adamic-Adar algorithm but applied in a different context. `N(u)` represents the set of nodes adjacent to node `u`.

### Key Points:

- **Purpose:** Assesses the closeness of nodes based on how resources would be allocated through their common connections.
- **Interpretation:** Higher values suggest a closer relationship due to efficient resource sharing.
- **Usage:** Function available in the library for calculating resource allocation efficiency.

## Same Community Algorithm

The Same Community algorithm determines whether two nodes belong to the same community, which is crucial for understanding the structure of networks and predicting future connections based on community membership.


  #### Key Points:

- **Purpose:** Evaluates potential connections based on the breadth of an individual's network.
- **Interpretation:** Higher values indicate a greater likelihood of forming new connections.
- **Usage:** Library function for assessing the extent of node connections.

  #### Related Techniques and Metrics:

- **Production-quality:** Ensures that the algorithm is suitable for use in real-world applications.
- **Conductance metric:** Measures the quality of a graph partitioning into communities.
- **K-Core Decomposition:** Identifies the core structure of the network by peeling off layers of the graph.
- **K-1 Coloring:** A graph coloring method that helps in distinguishing communities.
- **K-Means Clustering:** A partitioning method that can be used to group nodes into communities based on their features.
- **Label Propagation:** Utilizes node labels to propagate and determine communities rapidly.
- **Leiden:** An algorithm that refines the partitioning of a network into communities for higher quality results.
- **Local Clustering Coefficient:** Measures the degree to which nodes in a graph tend to cluster together.
- **Louvain:** A popular method for detecting communities based on modularity optimization.
- **Modularity metric:** Quantifies the strength of division of a network into communities.
- **Modularity Optimization:** Aims to maximize the modularity metric for better community detection.
- **Strongly Connected Components:** Identifies groups of nodes where every node is reachable from every other node in the group.
- **Triangle Count:** Can indicate tightly-knit groups of nodes, suggesting potential communities.
- **Weakly Connected Components:** Finds groups of nodes connected by paths regardless of direction.
- **Alpha:** A parameter in some algorithms that influences the detection of communities.
- **Approximate Maximum k-cut:** A method for dividing the graph into k groups to maximize the weight of the edges within each group.
- **Speaker-Listener Label Propagation (SLPA):** An algorithm that considers the dynamics of speaking and listening behaviors of nodes for community detection.


</div>

This method provides a binary outcome: `0` indicates nodes are in different communities, while `1` signifies that both nodes are within the same community.

### Key Points:

- **Purpose:** Identifies whether two nodes are part of the same social or functional group.
- **Interpretation:** A value of 1 indicates a strong likelihood of connection due to shared community membership.
- **Usage:** Function in the library for detecting community-based connections.

## Total Neighbors Algorithm

Total Neighbors measures the closeness of nodes based on the total number of unique neighbors they have, underlining the idea that nodes with more connections are more likely to form new links.

<div align="center">
    <img src="Images/Total Neighbors.png" alt="Total Neighbors Formula" width="300" />
</div>

This formula calculates the combined unique set of neighbors for two nodes, where `N(x)` and `N(y)` represent the sets of nodes adjacent to nodes `x` and `y`, respectively.

### Key Points:

- **Purpose:** Evaluates potential connections based on the breadth of an individual's network.
- **Interpretation:** Higher values indicate a greater likelihood of forming new connections.
- **Usage:** Library function for assessing the extent of node connections.



## Let's Run the Algorithms Query

```ruby
MATCH (p1:Person {name: 'Hank'}), (p2:Person {name: 'Jack'})
WITH p1, p2
RETURN 
    gds.alpha.linkprediction.adamicAdar(p1, p2) AS AdamicAdar,
    gds.alpha.linkprediction.commonNeighbors(p1, p2) AS CommonNeighbors,
    gds.alpha.linkprediction.preferentialAttachment(p1, p2) AS PreferentialAttachment,
    gds.alpha.linkprediction.resourceAllocation(p1, p2) AS ResourceAllocation,
    gds.alpha.linkprediction.sameCommunity(p1, p2) AS SameCommunity,
    gds.alpha.linkprediction.totalNeighbors(p1, p2) AS TotalNeighbors
```



