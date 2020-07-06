CREATE TABLE naics (
    code   INTEGER PRIMARY KEY,
    value  TEXT NOT NULL
);

CREATE TABLE ppp_over_150k (
    loan_range      TEXT,
    business_name   TEXT,
    address         TEXT,
    city            TEXT,
    state           TEXT,
    zip             TEXT,
    naics_code      INTEGER,
    business_type   TEXT,
    race_ethnicity  TEXT,
    gender          TEXT,
    veteran         TEXT,
    non_profit      BOOLEAN,
    jobs_retained   INTEGER,
    date_approved   DATE,
    lender          TEXT,
    cd              TEXT
);

CREATE TABLE ppp_under_150k (
    loan_amount     NUMERIC(8, 2),
    city            TEXT,
    state           TEXT,
    zip             TEXT,
    naics_code      INTEGER,
    business_type   TEXT,
    race_ethnicity  TEXT,
    gender          TEXT,
    veteran         TEXT,
    non_profit      BOOLEAN,
    jobs_retained   INTEGER,
    date_approved   DATE,
    lender          TEXT,
    cd              TEXT
);

 CREATE MATERIALIZED VIEW ppp_under_150k_by_category_and_state AS
    SELECT b.value AS category,
           a.state,
           sum(a.jobs_retained) AS jobs_retained,
           sum(a.loan_amount) AS total_loan_amount
     FROM ppp_under_150k AS a
     JOIN naics AS b ON b.code = a.naics_code
 GROUP BY b.value, a.state
 ORDER BY sum(a.loan_amount) DESC;
