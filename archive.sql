-- 1
127.0.0.1/usairlineflights2/flights/		http://localhost/phpmyadmin/tbl_sql.php?db=usairlineflights2&table=flights
Your SQL query has been executed successfully.

SELECT COUNT(*) FROM flights



4758

-- 2
127.0.0.1/usairlineflights2/flights/		http://localhost/phpmyadmin/tbl_sql.php?db=usairlineflights2&table=flights
 Showing rows 0 - 24 (213 total, Query took 0.0028 seconds.)

 SELECT
     Origin,
     AVG(ArrDelay),
     AVG(DepDelay)
 FROM
     flights
 GROUP BY
     Origin


Origin	AVG(ArrDelay)	AVG(DepDelay)
ABE	17.1250	15.7500
ABQ	3.8158	6.8684
ABY	4.5000	19.0000
AGS	19.0000	15.3333
ALB	-2.2500	-0.1250
AMA	1.2500	0.0000
ANC	1.8571	3.5000
ASE	7.0000	10.0000
ATL	9.5720	9.8833
ATW	0.6667	1.6667
AUS	1.5455	1.2273
AVL	-7.6667	-3.3333
AZO	-10.0000	-5.0000
BDL	-4.4348	2.7826
BET	1.0000	-2.0000
BFL	-6.0000	0.0000
BGR	45.0000	60.0000
BHM	5.7500	8.3750
BIL	14.0000	4.5000
BIS	17.0000	0.0000
BNA	7.8936	8.9574
BOI	3.6667	2.0000
BOS	5.8286	8.3238
BTR	7.6667	-0.8333
BTV	-11.4444	-4.0000


-- 3
127.0.0.1/usairlineflights2/flights/		http://localhost/phpmyadmin/tbl_sql.php?db=usairlineflights2&table=flights
 Showing rows 0 - 24 (4062 total, Query took 0.0133 seconds.) [Origin: ABE... - ABQ...] [colYear: 1988... - 1998...] [colMonth: 5... - 1...]

 SELECT
     Origin,
     colYear,
     colMonth,
     AVG(arrdelay)
 FROM
     flights
 GROUP BY
     colYear,
     colMonth,
     Origin
 ORDER BY
     Origin,
     colYear,
     colMonth


Origin   	colYear   	colMonth   	avg(arrdelay)
ABE	1988	5	73.0000
ABE	1988	11	26.0000
ABE	1990	1	-4.0000
ABE	1990	12	-5.0000
ABE	1991	7	10.0000
ABE	1992	6	-5.0000
ABE	2005	1	-18.0000
ABE	2006	1	60.0000
ABQ	1987	10	10.0000
ABQ	1989	1	7.0000
ABQ	1990	4	-3.0000
ABQ	1991	1	6.0000
ABQ	1993	11	3.0000
ABQ	1994	1	12.0000
ABQ	1995	1	-8.0000
ABQ	1995	7	-1.0000
ABQ	1995	8	7.0000
ABQ	1995	9	-2.0000
ABQ	1996	1	-1.0000
ABQ	1996	7	0.0000
ABQ	1997	9	-8.0000
ABQ	1997	10	12.0000
ABQ	1997	11	-11.0000
ABQ	1997	12	14.0000
ABQ	1998	1	-5.0000


-- 4
127.0.0.1/usairlineflights2/		http://localhost/phpmyadmin/db_sql.php?db=usairlineflights2
 Showing rows 0 - 24 (4062 total, Query took 0.0225 seconds.) [City: ALBANY... - ALBUQUERQUE...] [colYear: 1988... - 1997...] [colMonth: 3... - 11...]

 SELECT
     usairports.City,
     flights.colYear,
     flights.colMonth,
     AVG(flights.arrdelay)
 FROM
     flights
 JOIN usairports ON flights.Origin = usairports.IATA
 GROUP BY
     flights.colYear,
     flights.colMonth,
     flights.Origin
 ORDER BY
     usairports.City,
     flights.colYear,
     flights.colMonth

City   	colYear	colMonth	avg(flights.arrdelay)
Albany	1988	3	-6.0000
Albany	1992	12	-18.0000
Albany	1993	10	0.0000
Albany	1994	10	-11.0000
Albany	2003	3	-4.0000
Albany	2004	10	1.0000
Albany	2006	1	-8.0000
Albany	2006	3	17.0000
Albany	2007	6	5.0000
Albany	2008	12	15.0000
Albuquerque	1987	10	10.0000
Albuquerque	1989	1	7.0000
Albuquerque	1990	4	-3.0000
Albuquerque	1991	1	6.0000
Albuquerque	1993	11	3.0000
Albuquerque	1994	1	12.0000
Albuquerque	1995	1	-8.0000
Albuquerque	1995	7	-1.0000
Albuquerque	1995	8	7.0000
Albuquerque	1995	9	-2.0000
Albuquerque	1996	1	-1.0000
Albuquerque	1996	7	0.0000
Albuquerque	1997	9	-8.0000
Albuquerque	1997	10	12.0000
Albuquerque	1997	11	-11.0000


-- 5
127.0.0.1/usairlineflights2/flights/		http://localhost/phpmyadmin/db_sql.php?db=usairlineflights2
 Showing rows 0 - 12 (13 total, Query took 0.0073 seconds.)

SELECT
    flights.UniqueCarrier,
    flights.colYear,
    flights.colMonth,
    SUM(flights.Cancelled) AS "total_cancelled"
FROM
    flights
GROUP BY
    flights.colYear,
    flights.colMonth,
    flights.UniqueCarrier
HAVING
    SUM(flights.Cancelled) > 0
ORDER BY
    total_cancelled
DESC

-- corregido

SELECT
    flights.UniqueCarrier,
    flights.colYear,
    flights.colMonth,
    SUM(flights.Cancelled) AS "total_cancelled"
FROM
    flights
GROUP BY
    flights.colYear,
    flights.colMonth,
    flights.UniqueCarrier
HAVING
     total_cancelled > 0
ORDER BY
    total_cancelled
DESC

-- the output order differs from the exercise text
UniqueCarrier	colYear	colMonth	total_cancelled
DL	1988	1	3
UA	1990	2	1
TW	1987	11	1
PI	1988	7	1
DL	1990	5	1
AS	1988	9	1
US	1987	12	1
UA	1988	4	1
AA	1989	5	1
AS	1989	8	1
CO	1988	2	1
UA	1989	2	1
US	1990	8	1


-- 6

127.0.0.1/usairlineflights2/flights/		http://localhost/phpmyadmin/db_sql.php?db=usairlineflights2
 Showing rows 0 -  9 (10 total, Query took 0.0045 seconds.)

SELECT
    flights.TailNum,
    SUM(flights.distance) AS "total_distance"
FROM
    flights
WHERE
    flights.TailNum <> ""
GROUP BY
    flights.TailNum
ORDER BY
    total_distance
DESC
LIMIT 10


TailNum	total_distance
N543UA	7675
N12238	6829
N580JB	6277
N5DCAA	5300
N637DL	5223
N5DJAA	5046
N653UA	5005
N614UA	4950
N615DL	4948
N128DL	4584


-- 7
127.0.0.1/usairlineflights2/flights/		http://localhost/phpmyadmin/db_sql.php?db=usairlineflights2
 Showing rows 0 -  8 (9 total, Query took 0.0082 seconds.)

SELECT
    flights.UniqueCarrier,
    AVG(flights.ArrDelay) AS "avg_delay"
FROM
    flights
GROUP BY
    flights.UniqueCarrier
HAVING
    AVG(flights.ArrDelay) > 10
ORDER BY
    avg_delay
DESC


UniqueCarrier	avg_delay
TZ	38.5714
F9	32.8571
B6	20.3611
PI	17.7273
9E	16.4000
YV	13.2727
EV	13.0725 -- value differs from exercise text
OH	12.9310 -- value differs from exercise text
FL	12.0435 -- value differs from exercise text
