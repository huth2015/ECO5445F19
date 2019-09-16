# SQL Using ```.sql``` Scripts

## Sample database

Open a database to create in sqlite3

```
sqlite3 SampleDataBase.db
```

Now you should see the ```sqlite>``` prompt awaiting your next command.

Now read in the schema for the two tables that will make up ```SampleDataBase.db```.

```
sqlite> .read FirstTable.sql
sqlite> .read SecondTable.sql
```

To verify the list of tables, you can enter ```.tables``` and the table names will be listed.
The command ```.schema``` will display the schema for the tables.
However, to display the contents themselves, you can enter the basic query

```
sqlite> SELECT * FROM FirstTable;
```
and likewise for ```SecondTable```.

To execute the SQL query coded into the script ```ExampleThetaJoin.sql```, use the command ```.read``` at the ```sqlite>``` prompt,
just as you did for the creation of the tables.

```
sqlite> .read ExampleThetaJoin.sql
```

Since the script ```ExampleThetaJoin.sql``` includes a statement to output to a specific file
(```.output OutFileName.csv``` and the associated options), the resulting table can be seen in the working directory and viewed with any text editor.

## Auctions Database

In this example, the procedure is made more scalable by reading the tables from ```.csv``` files.
The procedure is very similar, aside from the commands for reading in the data.

Open a new database in sqlite3

```
sqlite3 AuctionsDataBase.db
```
Next, read in the scripts ```CreateAuctionsTable.sql```, ```CreateBiddersTable.sql``` and ```CreateBidsTable.sql``` to create the tables, just as for the sample database.

As above, you can verify the entry by executing the ```.tables``` and ```.schema``` commands.

The next step is to populate the tables with the ```.csv``` files associated with each, using the ```.import``` command.
```
.separator ,
.import AuctionsTable.csv Auctions
.import BiddersTable.csv Bidders
.import BidsTable.csv Bids
```
You can still verify the contents of the tables with the query
```
sqlite> SELECT * FROM Auctions;
```
and so on but we will move on to the scripted queries instead.

To view the products of the queries, you may want to keep open a terminal window to view the output of ```ls``` before and after the query to see the output file created.

As above, execute the queries using the ```.read``` command at the ```sqlite>``` prompt.

```
sqlite> .read ComputeBidSummariesByBidder.sql
```
Now you can view the table ```ComputeBidSummariesByBidder.out``` as specified in the script.
The procedure is the same for the other queries.
