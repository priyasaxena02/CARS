import cx_Oracle

import csv



con = cx_Oracle.connect('<SCHEMA_NAME>/<PASSWORD>@<HOST>:<PORT>/<SID>')

cur = con.cursor()

with open("<location of csv file>/daily_adjusted_CAR.csv", "r") as csv_file:

    csv_reader = csv.reader(csv_file, delimiter=',')

    next(csv_reader)

    for lines in csv_reader:

        cur.execute("INSERT INTO ticker_adjusted_price (ticker, timestamp, open, high, low, close, adjusted_close, volume, dividend_amount, split_coefficient) VALUES ('CAR', to_date(:1,'dd-mm-yyyy'), :2, :3, :4, :5, :6, :7, :8, :9)",

            (lines[0], lines[1], lines[2], lines[3], lines[4], lines[5], lines[6], lines[7], lines[8]))



cur.close()

con.commit()

con.close()

print('Done')
