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
