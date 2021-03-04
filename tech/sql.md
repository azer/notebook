## SQL

### Emoji Support

Enable in entire DB:

```sql
ALTER DATABASE
    database_name
    CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_unicode_ci;
```

Only in selected table:

```sql
ALTER TABLE
    table_name
    CONVERT TO CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;
```

Update the DB driver: 

```
root:root@tcp(127.0.0.1 :3306)/DB_NAME?parseTime=1&charset=utf8mb4&collation=utf8mb4_unicode_ci
```

### Run SQL Query & Save Results to File

```bash
$ mysql -user -pass -e "select cols from table where cols not null" > /tmp/output
```

### Store Emoji

1) Database: Change Database default collation as utf8mb4.

2) Table: Change table collation as CHARACTER SET utf8mb4 COLLATE utf8mb4_bin.

Query:

```sql
ALTER TABLE Tablename CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
```

3) Code:

```sql
INSERT INTO tablename (column1, column2, column3, column4, column5, column6, column7)
VALUES ('273', '3', 'Hdhdhdh😜😀😊😃hzhzhzzhjzj 我爱你 ❌', 49, 1, '2016-09-13 08:02:29', '2016-09-13 08:02:29')
```

4) Set utf8mb4 in database connection:


### Profiling

```sql
SET profiling = 1;
```

Execute your query, then list profiled queries;

```sql
SHOW PROFILES;
```

Choose which profile you'd like to see in detail, then:

```sql
SHOW PROFILE FOR QUERY 1;
```

### Indexes:

Create an index:

```sql
CREATE INDEX idx_will_be_indexed ON page (will_be_indexed);
```

[Create a partial index:](https://www.databasejournal.com/features/mysql/article.php/3840606/Maximizing-Query-Performance-through-Column-Indexing-in-MySQL.htm)

```sql
CREATE INDEX index_name ON table_name (field_name(prefix_length));
```

Create a [unique](https://stackoverflow.com/questions/707874/differences-between-index-primary-unique-fulltext-in-mysql) index:

```sql
CREATE UNIQUE INDEX idx_token ON user (token);
```

See what indexes use query:

```sql
EXPLAIN SELECT ...
```

List all indexes:

```sql
SHOW INDEX FROM page;
```

Delete an index:

```sql
DROP INDEX index_name ON table_name
```

#### Difference Between Index Types:

* **KEY or INDEX** refers to a normal non-unique index. Non-distinct values for the index are allowed, so the index may contain rows with identical values in all columns of the index. These indexes don't enforce any restraints on your data so they are used only for making sure certain queries can run quickly.

* **UNIQUE** refers to an index where all rows of the index must be unique. That is, the same row may not have identical non-NULL values for all columns in this index as another row. As well as being used to speed up queries, UNIQUE indexes can be used to enforce restraints on data, because the database system does not allow this distinct values rule to be broken when inserting or updating data. Your database system may allow a UNIQUE index to be applied to columns which allow NULL values, in which case two rows are allowed to be identical if they both contain a NULL value (the rationale here is that NULL is considered not equal to itself). Depending on your application, however, you may find this undesirable: if you wish to prevent this, you should disallow NULL values in the relevant columns.

* **PRIMARY** acts exactly like a UNIQUE index, except that it is always named 'PRIMARY', and there may be only one on a table (and there should always be one; though some database systems don't enforce this). A PRIMARY index is intended as a primary means to uniquely identify any row in the table, so unlike UNIQUE it should not be used on any columns which allow NULL values. Your PRIMARY index should be on the smallest number of columns that are sufficient to uniquely identify a row. Often, this is just one column containing a unique auto-incremented number, but if there is anything else that can uniquely identify a row, such as "countrycode" in a list of countries, you can use that instead. Some database systems (such as MySQL's InnoDB) will store a table's records on disk in the order in which they appear in the PRIMARY index.

* **FULLTEXT** indexes are different from all of the above, and their behaviour differs significantly between database systems. FULLTEXT indexes are only useful for full text searches done with the MATCH() / AGAINST() clause, unlike the above three - which are typically implemented internally using b-trees (allowing for selecting, sorting or ranges starting from left most column) or hash tables (allowing for selection starting from left most column).

### Alter Table

Add a column;

```sql
ALTER TABLE `table` ADD COLUMN `created_at` BIGINT(20) NULL DEFAULT 0 AFTER `page_id`;
```

Rename a column:

```sql
ALTER TABLE `page` CHANGE `page_language` `language` VARCHAR(255) COLLATE utf8mb4_unicode_ci;
```

Remove a column:

```sql
ALTER TABLE `page` DROP COLUMN `content_language`;
```

### Grant Privileges

GRANT ALL PRIVILEGES ON *.* TO 'user'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;
