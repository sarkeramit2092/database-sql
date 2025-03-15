CREATE TABLE test(
    my_date DATE,
    my_time TIME,
    my_datetime DATETIME
);

SELECT * FROM test;

INSERT INTO test
VALUES(CURRENT_DATE(), CURRENT_TIME(), NOW());

INSERT INTO test
VALUES(CURRENT_DATE() + 1, NULL, NULL);

INSERT INTO test
VALUES(CURRENT_DATE() - 1, NULL, NULL);

DROP TABLE test;


