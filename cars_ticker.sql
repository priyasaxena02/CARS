--1. Consider we have a schema name as PRJ_SCH
--2. We will create the table named as ticker dim for keeping ticker reference data

CREATE TABLE tickers (
                      ticker_id           NUMBER (20),
                      ticker              VARCHAR2 (10),
                      ticker_identifier   VARCHAR2 (10),
                      create_id           VARCHAR2 (30),
                      create_date         DATE,
                      update_id           VARCHAR2 (30),
                      update_date         DATE
                     );

CREATE TABLE ticker_dim (
                         ticker_dim_key        NUMBER (20),
                         ticker_id             NUMBER (20),
                         dim_effective_date    DATE,
                         dim_expiration_date   DATE,
                         ticker_identifier     VARCHAR2 (10),
                         company_name          VARCHAR2 (200),
                         create_id             VARCHAR2 (30),
                         create_date           DATE,
                         update_id             VARCHAR2 (30),
                         update_date           DATE
                        );

CREATE SEQUENCE ticker_sequence
   MINVALUE 1
   MAXVALUE 999999
   START WITH 1
   INCREMENT BY 1
   CACHE 10;

CREATE SEQUENCE ticker_dim_seq
   MINVALUE 1
   MAXVALUE 999999
   START WITH 1
   INCREMENT BY 1
   CACHE 10;

INSERT INTO tickers
     VALUES (
             ticker_sequence.NEXTVAL,
             'CRZ',
             'L_CARS',
             USER,
             SYSDATE,
             NULL,
             NULL
            );

INSERT INTO ticker_dim
     VALUES (
             ticker_dim_seq.NEXTVAL,
             1,
             TO_DATE ('01-JAN-1900', 'DD-MON-YYYY'),
             NULL,
             'L_CARS',
             'Carsales.com',
             USER,
             SYSDATE,
             NULL,
             NULL
            );

--3. Now updating the new ticker as available

UPDATE tickers
   SET ticker = 'CAR', update_id = USER, update_date = SYSDATE
 WHERE ticker_identifier = 'L_CARS';

INSERT INTO ticker_dim
     VALUES (
             ticker_dim_seq.NEXTVAL,
             1,
             TO_DATE ('26-FEB-2015', 'DD-MON-YYYY'),
             NULL,
             'L_CARS',
             'Carsales.com',
             USER,
             SYSDATE,
             NULL,
             NULL
            );

UPDATE ticker_dim
   SET dim_expiration_date      = TO_DATE ('26-FEB-2015', 'DD-MON-YYYY')- 1 / (24 * 60*60)
 WHERE ticker_dim_key = 1;


SELECT * FROM tickers;

SELECT * FROM ticker_dim;


CREATE TABLE ticker_adjusted_price (
                                    ticker              VARCHAR2(10),
                                    timestamp           DATE,
                                    open                NUMBER,
                                    high                NUMBER,
                                    low                 NUMBER,
                                    close               NUMBER,
                                    adjusted_close      NUMBER,
                                    volume              NUMBER,
                                    dividend_amount     NUMBER,
                                    split_coefficient   NUMBER
                                   );

SELECT *
  FROM ticker_adjusted_price
