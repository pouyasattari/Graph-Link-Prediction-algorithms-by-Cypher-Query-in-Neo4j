<div align="center">
  <p>
    Let's introduce Relational Link Prediction Algorithms on Graph Database 
  </p>
  <img src="https://sattari.org/wp-content/uploads/2024/02/ScreenRecording2024-02-08at03.17.20-ezgif.com-video-to-gif-converter-1-copy-3.gif" alt="Cover Image" style="max-width:100%; max-height:300px; pointer-events: none;">
</div>



# ⚛︎ Graph Database Creation in Neo4j 

To create your database you can use [this Cypher Query](/Database%20Creation%20Query.cypher) to create these **nodes** and **relationships** :


# 🧪 Link Prediction Algorithms  

## Adamic-Adar Algorithm

The Adamic-Adar algorithm was introduced in 2003 by Lada Adamic and Eytan Adar. It's designed to predict links in a social network by measuring the closeness between pairs of nodes. The algorithm calculates the similarity between nodes based on the commonality of their connections, using the following formula:

<img src="https://neo4j.com/docs/graph-data-science/current/_images/equations/adamic-adar.svg" alt="Adamic-Adar Formula" />

The formula essentially sums the inverse logarithm of the degree of common neighbors between two nodes. Here, `N(u)` represents the set of nodes adjacent to node `u`. A computed value of 0 indicates that two nodes are not close, suggesting no common neighbors, while higher values signify a closer relationship, indicating multiple shared connections.

### Key Points:

- **Purpose:** Predicts the likelihood of a future link between two nodes in a social network.
- **Interpretation:** A higher Adamic-Adar score implies a stronger relationship or connection likelihood between the nodes based on their shared neighbors.
- **Usage:** The library provides a function to calculate the closeness between two nodes.


