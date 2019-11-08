# CARS

Part1 ) CARS_TICKER.SQL

Table - Ticker Adjusted Price

        This table consists of Pricing entries made and their ticker values.
        
        Following are values:
        
        Ticker (Contains ticker for Company)
        Date            
        Open            
        High            
        Low Close 
        Adjusted_close      
        Volume              
        Dividend_amount     
        Split_coefficient   
        
Table - tickers

        To make the ticker functionality more scalable this table is made to store the ticker active for the current date for each Company. 
       
       Following are values:
       
        ticker_id - A sequence for each entry in the table
        ticker - Ticker Value
        ticker_identifier - Identifier pertaining to a company that holds the ticker Value
        create_id - Created By Id       
        create_date - Created by Date     
        update_id - Updated By Id        
        update_date - Updated by Date
        
 Table - ticker_dim
 
         A dimension table is implemented for tickers so that we can track the details for each ticker.
         
         Following are values:
         
         ticker_dim_key - A dim key reoresenting sequence for each entry       
         ticker_id - Ticker Id corressponding to Id in 'tickers' table     
         dim_effective_date - Date at which ticker is effective   
         dim_expiration_date  - Date at which ticker is expired
         ticker_identifier    - Ticker idetifier corressponding to the company of the ticker 
         company_name         - Name of the Company 
         create_id            - Creation By 
         create_date          - Created Date
         update_id            - Updated By
         update_date          - Updation Date
         
 Part2) CSV_INSERT.PY
 
  This is file written in Python code to upload the csv into database for the schema designed in Part1. 
  The csv file uploaded has been taken from  'https://www.alphavantage.co'.
