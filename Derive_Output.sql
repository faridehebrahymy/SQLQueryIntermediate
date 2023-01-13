DROP TABLE source;
CREATE TABLE source
    (
        id      int,
        name    varchar(1)
    );

DROP TABLE target;
CREATE TABLE target
    (
        id      int,
        name    varchar(1)
    );

INSERT INTO source VALUES (1, 'A');
INSERT INTO source VALUES (2, 'B');
INSERT INTO source VALUES (3, 'C');
INSERT INTO source VALUES (4, 'D');

INSERT INTO target VALUES (1, 'A');
INSERT INTO target VALUES (2, 'B');
INSERT INTO target VALUES (4, 'X');
INSERT INTO target VALUES (5, 'F');

SELECT * FROM source;
SELECT * FROM target;

SELECT s.id , 'Mismatch' AS Comment
FROM source AS S
JOIN target AS T ON S.id = T.id AND S.name <> T.name
  UNION 
SELECT S.id, 'New In Source' AS Comment
FROM source S
LEFT JOIN target  T ON S.id =T.id
WHERE T.id IS NULL
UNION
SELECT T.id , 'New In Target' AS Comment
FROM source S
RIGHT JOIN target  T ON S.id =T.id
WHERE S.id IS NULL
;









