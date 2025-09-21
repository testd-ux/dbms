Got it 👍. I’ll write down all the PL/SQL codes from your images neatly and fully so you can use them directly.


---

Table Creation and Insert

CREATE TABLE stu (
    id INTEGER,
    name VARCHAR(25),
    marks INTEGER
);

INSERT INTO stu VALUES (21, 'Abh K', 30);


---

Trigger 1: After Insert – Display Message

CREATE OR REPLACE TRIGGER trig
AFTER INSERT ON stu
BEGIN
    DBMS_OUTPUT.PUT_LINE('You have inserted 1 row to student table');
END;
/

Example Insert and Output:

INSERT INTO stu VALUES (135, 'Lucy', 21);
-- Output: You have inserted 1 row to student table


---

Table for Counting Inserts

CREATE TABLE count152 (
    count NUMBER
);

INSERT INTO count152 VALUES (0);


---

Trigger 2: After Insert – Update Count

CREATE OR REPLACE TRIGGER entry
AFTER INSERT ON stu
BEGIN
    UPDATE count152
    SET count = count + 1;
END;
/

Example Inserts and Count Update:

INSERT INTO stu VALUES (149, 'Ryu Saka', 93);
-- Output: You have inserted 1 row to student table

INSERT INTO stu VALUES (111, 'Mizuki', 96);
-- Output: You have inserted 1 row to student table

count152 now has value 2.


---

Trigger 3: After Delete – Display Message

CREATE OR REPLACE TRIGGER deltrig
AFTER DELETE ON stu
BEGIN
    DBMS_OUTPUT.PUT_LINE('You have deleted one row from student table');
END;
/

Example Delete and Output:

DELETE FROM stu WHERE id = 21;
-- Output: You have deleted one row from student table


---

Backup Table for Deleted Rows

CREATE TABLE newstu (
    id INTEGER,
    name VARCHAR(25),
    marks INTEGER
);


---

Trigger 4: Before Delete – Store Deleted Records

CREATE OR REPLACE TRIGGER newtrig
BEFORE DELETE ON stu
FOR EACH ROW
BEGIN
    INSERT INTO newstu VALUES (:OLD.id, :OLD.name, :OLD.marks);
END;
/

Example Delete and Output:

DELETE FROM stu WHERE name = 'Ryu Saka';
-- Output: You have deleted one row from student table

Result:

newstu will have the deleted record.

stu will show only remaining rows.



---

👉 Do you want me to also write the final state of tables (stu, count152, newstu) after all operations exactly like in your notebook (with sample data in them)?


