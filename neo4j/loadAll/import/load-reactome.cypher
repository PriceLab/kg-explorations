LOAD CSV with HEADERS from 'file:///R-HSA-165159-nodes.tsv' AS line FIELDTERMINATOR '\t'
     CREATE (:Entity {id: line.id,
                        name: line.label,
                        type: line.type,
                        parent: line.parent});

CREATE INDEX ON :Entity(id);

LOAD CSV WITH HEADERS FROM  "file:///R-HSA-165159-edges.tsv" AS line FIELDTERMINATOR '\t'
      MATCH (source:Entity {id: line.source}), (target:Entity {id: line.target})
      CREATE (source)-[:interacts {type: line.interaction}]->(target);
      

