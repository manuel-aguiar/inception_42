
Redis-cache works as an in-memory database. php scripts (run by phpfpm) will connect to it to see
if certain data was requested and is still in memory at the redis-cache -> BEFORE asking mariadb
Therefore saving time for frequently asked pages, for instance.
