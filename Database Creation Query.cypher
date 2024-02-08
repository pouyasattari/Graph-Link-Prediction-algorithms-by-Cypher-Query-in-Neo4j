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
