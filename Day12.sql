-- Day 12 - LEFT JOIN Lesson Dataset (snake_case)
-- Domain: Public Library
-- Core exercises use ONLY 2-table joins. Step-up challenges add a 3rd/4th table.
-- You can run this whole file in psql or your favorite PostgreSQL client.

-- ----------
-- Teardown (safe re-run)
-- ----------
-- DROP TABLE IF EXISTS book_author CASCADE;
-- DROP TABLE IF EXISTS checkout CASCADE;
-- DROP TABLE IF EXISTS inventory CASCADE;
-- DROP TABLE IF EXISTS member_account CASCADE;
-- DROP TABLE IF EXISTS book CASCADE;
-- DROP TABLE IF EXISTS author CASCADE;
-- DROP TABLE IF EXISTS library_branch CASCADE;

-- ----------
-- Tables
-- ----------
CREATE SCHEMA IF NOT EXISTS university;

CREATE TABLE library_branch (
  branch_id      INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  branch_name    TEXT NOT NULL,
  city           TEXT NOT NULL
);

CREATE TABLE book (
  book_id        INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title          TEXT NOT NULL,
  published_year INTEGER
);

CREATE TABLE inventory (
  branch_id  INTEGER NOT NULL REFERENCES library_branch(branch_id) ON DELETE CASCADE,
  book_id    INTEGER NOT NULL REFERENCES book(book_id) ON DELETE CASCADE,
  copies     INTEGER NOT NULL DEFAULT 0 CHECK (copies >= 0),
  PRIMARY KEY (branch_id, book_id)
);

CREATE TABLE member_account (
  member_id     INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  member_name   TEXT NOT NULL,
  home_branch_id INTEGER NULL REFERENCES library_branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE checkout (
  checkout_id   INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  member_id     INTEGER NOT NULL REFERENCES member_account(member_id) ON DELETE CASCADE,
  book_id       INTEGER NOT NULL REFERENCES book(book_id) ON DELETE CASCADE,
  checkout_date DATE NOT NULL,
  return_date   DATE NULL
);

CREATE TABLE author (
  author_id   INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  first_name  TEXT NOT NULL,
  last_name   TEXT NOT NULL
);

CREATE TABLE book_author (
  book_id   INTEGER NOT NULL REFERENCES book(book_id) ON DELETE CASCADE,
  author_id INTEGER NOT NULL REFERENCES author(author_id) ON DELETE CASCADE,
  PRIMARY KEY (book_id, author_id)
);

-- ----------
-- Seed Data
-- ----------

-- Branches
INSERT INTO library_branch (branch_name, city) VALUES
('Central',   'Greencastle'),
('Northside', 'Greencastle'),
('Riverside', 'Plainfield'),
('South Hill','Avon');

-- Books
INSERT INTO book (title, published_year) 
VALUES
    ('Kindred', 1979),
    ('American Gods', 2001),
    ('Beloved', 1987),
    ('Kafka on the Shore', 2002),
    ('Invisible Cities', 1972);

-- Inventory (note: South Hill has no inventory; several books absent at branches)
-- We'll lookup generated IDs to keep it robust across re-runs.
WITH b AS (
  SELECT branch_id, branch_name FROM library_branch
),
k AS (
      SELECT book_id, title FROM book
     )
INSERT INTO inventory (branch_id, book_id, copies) 
VALUES
    ((SELECT branch_id FROM b WHERE branch_name='Central'),   (SELECT book_id FROM k WHERE title='Kindred'), 4),
    ((SELECT branch_id FROM b WHERE branch_name='Central'),   (SELECT book_id FROM k WHERE title='American Gods'), 2),
    ((SELECT branch_id FROM b WHERE branch_name='Northside'), (SELECT book_id FROM k WHERE title='Kindred'), 1),
    ((SELECT branch_id FROM b WHERE branch_name='Northside'), (SELECT book_id FROM k WHERE title='Kafka on the Shore'), 3),
    ((SELECT branch_id FROM b WHERE branch_name='Riverside'), (SELECT book_id FROM k WHERE title='Beloved'), 2);

-- Members
INSERT INTO member_account (member_name, home_branch_id) 
VALUES
    ('Alex Rivera',  (SELECT branch_id FROM library_branch WHERE branch_name='Central')),
    ('Sam Patel',    (SELECT branch_id FROM library_branch WHERE branch_name='Northside')),
    ('Jordan Lee',   (SELECT branch_id FROM library_branch WHERE branch_name='South Hill')),
    ('Morgan Chen',  NULL);

-- Checkouts (historical)
INSERT INTO checkout (member_id, book_id, checkout_date, return_date) 
VALUES
(
    (SELECT member_id FROM member_account WHERE member_name='Alex Rivera'),
    (SELECT book_id FROM book WHERE title='Kindred'),
      DATE '2025-09-10',
      DATE '2025-09-17'
    ),
(
  (SELECT member_id FROM member_account WHERE member_name='Alex Rivera'),
  (SELECT book_id FROM book WHERE title='American Gods'),
  DATE '2025-09-18',
  NULL
),
(
  (SELECT member_id FROM member_account WHERE member_name='Sam Patel'),
  (SELECT book_id FROM book WHERE title='Kafka on the Shore'),
  DATE '2025-09-05',
  DATE '2025-09-12'
);

-- Authors (one has no mapped books yet)
INSERT INTO author (first_name, last_name) 
VALUES
    ('Octavia','Butler'),
    ('Neil','Gaiman'),
    ('Toni','Morrison'),
    ('Haruki','Murakami'),
    ('New','Author'); -- no mapping

-- Book-Author mappings (leave 'Invisible Cities' unmapped to show missing links)
INSERT INTO book_author (book_id, author_id) 
VALUES
      ((SELECT book_id FROM book WHERE title='Kindred'),             (SELECT author_id FROM author WHERE last_name='Butler')),
      ((SELECT book_id FROM book WHERE title='American Gods'),       (SELECT author_id FROM author WHERE last_name='Gaiman')),
      ((SELECT book_id FROM book WHERE title='Beloved'),             (SELECT author_id FROM author WHERE last_name='Morrison')),
      ((SELECT book_id FROM book WHERE title='Kafka on the Shore'),  (SELECT author_id FROM author WHERE last_name='Murakami'));


--Day 12: Breakout Rooms

-- ----------
-- CORE BREAKOUT EXERCISES (2-table joins only)
-- ----------

--expplore tables
SELECT * FROM public.book_author; --mappng table - book to author
SELECT * FROM public.checkout; -- shows activity - links member to book
SELECT * FROM public.inventory; --(branch - book - copies)
SELECT * FROM public.member_account;
SELECT * FROM public.book;
SELECT * FROM public.author;
SELECT * FROM public.library_branch;

-- 1
-- Write a query to create a list of all books, and then display the number of copies in inventory. 
-- (Display NULL or 0 if not stocked.)
-- Which 2 tables are needed? book & inventory
-- Which field in each table can be used to JOIN the tables together?
-- Should it be an INNER JOIN or LEFT OUTER JOIN?
-- Discussion question: How did you decide which table to list first?
-- Discussion question: What would happen if this was written as an INNER JOIN instead of a LEFT JOIN?

SELECT SUM(i.copies)
FROM public.book b
    LEFT JOIN public.inventory i
    ON b.book_id=i.book_id

--2
-- Write a query to list all branches and any book_ids which are in inventory. 
-- (Display NULL to represent no inventory.)
-- Question: Why must library_branch be the left table here? Bc it's the child table, inventory has both branch and book ids

SELECT 
  lb.branch_name "Branch",
  i.book_id "Book ID"
FROM 
  public.library_branch lb
  LEFT JOIN public.inventory i ON lb.branch_id = i.branch_id


-- Add a 3rd table:  Build upon the query in exercise 2 
-- Write a query to return the branch_name and book title – this can be achieved by: 
-- Adding a JOIN to a 3rd table and modifying the fields in the SELECT clause  
-- Question: Does it matter if the new JOIN is a LEFT JOIN or an INNER JOIN?
-- LEFT JOIN will keeps all branches even if they have no inventory
-- INNER JOIN only keeps rows where i.book_id = b.book_id

SELECT lb.branch_name "Branch", b.title "Book Title"
FROM public.library_branch lb
    LEFT JOIN public.inventory i ON lb.branch_id = i.branch_id
    JOIN public.book b ON b.book_id = i.book_id

-- Create a list of books and author_ids - include those missing authors














-- 1) Write a query to list all books and the number of copies in inventory.  (Display NULL if not stocked) —- HINT: Book LEFT JOIN Inventory
-- Use case: collection overview must list every book.
--Steps - look at each table, evaluate how they might JOIN, which field will they JOIN on?  
--Should it be an INNER JOIN or LEFT JOIN?  
SELECT 
    b.book_id, 
    b.title, 
    i.copies
FROM 
    public.book AS b
    LEFT JOIN public.inventory AS i ON b.book_id = i.book_id
ORDER BY 
    b.book_id
    , i.copies NULLS LAST;
--Discussion questions:
--How did you decide which table to list first?
--What would happen if this was an INNER JOIN instead of a LEFT JOIN?


-- 2) Write a query to list all branches and the list of distinct books
-- Branch coverage (count distinct books per branch, including zeros) — LibraryBranch LEFT JOIN Inventory
-- Use case: find branches with thin collections.

SELECT lb.branch_name,
       i.book_id
FROM 
    public.library_branch AS lb
    LEFT JOIN public.inventory AS i ON lb.branch_id = i.branch_id
ORDER BY 
    lb.branch_name;
--Question: Why must library_branch be the left table here?

-- --3) 
-- -------COUNT OF 
-- SELECT lb.branch_name,
--        COUNT(i.book_id) AS count_of_books
-- FROM 
--     public.library_branch AS lb
--     LEFT JOIN public.inventory AS i ON lb.branch_id = i.branch_id
-- GROUP BY 
--     lb.branch_name
-- ORDER BY 
--     lb.branch_name;

---------
--3)  Build upon Query 2 - Add a 3rd table to list the book title
SELECT lb.branch_name,
       b.title
FROM 
    public.library_branch AS lb
    LEFT JOIN public.inventory AS i ON lb.branch_id = i.branch_id
    LEFT JOIN public.book b ON i.book_id = b.book_id
ORDER BY 
    lb.branch_name;


-- 3) Generate data for a report of all users and their activity (checkouts)
-- Members and their most recent activity (or none) — 
-- Use case: engagement dashboard needs all members.
--select * from public.member_account
SELECT 
    m.member_name,
    c.checkout_date
FROM 
    public.member_account AS m
    LEFT JOIN public.checkout AS c ON m.member_id = c.member_id
ORDER BY 
    m.member_name;

--questions:
--did anyone check out more than 1 book?
--did anyone not return a book?

--bonus challenge: what if you only wanted a list of users with the most recent (MAX) checkout date?  
--can you modify the query to list all members and only the most recent checkout date?  (include users without a checkout date)
SELECT 
    m.member_name,
    MAX(c.checkout_date) AS most_recent_checkout
FROM 
    public.member_account AS m
    LEFT JOIN public.checkout AS c ON m.member_id = c.member_id
GROUP BY 
    m.member_name
ORDER BY 
    m.member_name;


-- 4) Authors with book counts (including zero) — Author LEFT JOIN BookAuthor
-- Use case: author program planning; find authors with no titles.
/*
SELECT a.first_name, a.last_name,
       COUNT(ba.book_id) AS books_authored
FROM public.author AS a
LEFT JOIN public.book_author AS ba
  ON a.author_id = ba.author_id
GROUP BY a.first_name, a.last_name
ORDER BY a.last_name, a.first_name;
*/

-- 5) Books missing author mappings — Book LEFT JOIN BookAuthor
-- Use case: data quality before catalog export.
SELECT 
    b.title,
    ba.author_id
FROM 
    public.book AS b
    LEFT JOIN public.book_author AS ba ON b.book_id = ba.book_id
ORDER BY 
    b.title;

SELECT b.title,
       CASE WHEN ba.author_id IS NULL THEN 'missing_author_map'
            ELSE 'has_author'
       END AS author_status
FROM public.book AS b
LEFT JOIN public.book_author AS ba
  ON b.book_id = ba.book_id
ORDER BY b.title;


-- 6) RIGHT→LEFT rewrite drill (still 2 tables)
-- Show equivalence: RIGHT JOIN inventory→library_branch == LEFT JOIN library_branch→inventory
/*
-- RIGHT JOIN form:
SELECT lb.branch_name, i.copies
FROM inventory AS i
RIGHT JOIN library_branch AS lb
  ON i.branch_id = lb.branch_id;

-- Equivalent LEFT JOIN:
SELECT lb.branch_name, i.copies
FROM library_branch AS lb
LEFT JOIN inventory AS i
  ON lb.branch_id = i.branch_id;
*/

-- ----------
-- STEP-UP CHALLENGES (3rd/4th table, incremental)
-- ----------

-- Challenge A: Branch coverage -> add book titles -> add checkout impact
/*
-- A2 (3 tables): list branch_name, title, copies
SELECT lb.branch_name, b.title, i.copies
FROM library_branch AS lb
LEFT JOIN inventory AS i ON lb.branch_id = i.branch_id
LEFT JOIN book      AS b ON i.book_id   = b.book_id
ORDER BY lb.branch_name, b.title;

-- A3 (4 tables): add total historical checkouts per branch & title
SELECT lb.branch_name, b.title,
       COALESCE(i.copies, 0) AS copies,
       COUNT(c.checkout_id)  AS total_checkouts
FROM library_branch AS lb
LEFT JOIN inventory AS i ON lb.branch_id = i.branch_id
LEFT JOIN book      AS b ON i.book_id   = b.book_id
LEFT JOIN checkout  AS c ON b.book_id   = c.book_id
GROUP BY lb.branch_name, b.title, i.copies
ORDER BY lb.branch_name, b.title;
*/

-- Challenge B: Authors with counts -> add book titles -> add circulation
/*
-- B2 (3 tables): authors and their titles (incl. authors with none)
SELECT a.last_name, a.first_name, b.title
FROM author AS a
LEFT JOIN book_author AS ba ON a.author_id = ba.author_id
LEFT JOIN book        AS b  ON ba.book_id  = b.book_id
ORDER BY a.last_name, a.first_name, b.title;

-- B3 (4 tables): add total checkouts per author
SELECT a.last_name, a.first_name,
       COUNT(c.checkout_id) AS total_checkouts
FROM author AS a
LEFT JOIN book_author AS ba ON a.author_id = ba.author_id
LEFT JOIN book        AS b  ON ba.book_id  = b.book_id
LEFT JOIN checkout    AS c  ON b.book_id   = c.book_id
GROUP BY a.last_name, a.first_name
ORDER BY total_checkouts DESC, a.last_name, a.first_name;
*/

-- Challenge C: Members’ activity -> add home branch
/*
-- C2 (3 tables): each member’s home branch and most recent checkout
SELECT m.member_name, lb.branch_name,
       MAX(c.checkout_date) AS most_recent_checkout
FROM member_account AS m
LEFT JOIN library_branch AS lb ON m.home_branch_id = lb.branch_id
LEFT JOIN checkout      AS c  ON m.member_id      = c.member_id
GROUP BY m.member_name, lb.branch_name
ORDER BY m.member_name;
*/

-- ----------
-- QUICK KNOWLEDGE CHECKS (use in class or quiz)
-- ----------
-- Q1: If we put inventory on the LEFT instead of book in exercise #1,
--     which rows vanish and why? (Books without inventory vanish.)
-- Q2: Rewrite RIGHT JOIN inventory→library_branch as LEFT JOIN (see #6).
-- Q3: How to sort Task #1 by copies descending with NULLs last?
--     ORDER BY i.copies DESC NULLS LAST;
-- Q4: How to show 0 for NULL copies in a SELECT list? Use COALESCE(i.copies, 0).