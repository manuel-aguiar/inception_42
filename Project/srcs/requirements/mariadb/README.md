MariaDB container

This container is responsible for launching the MariaDB Server.
The server will be actively listening for requests on port 3306 within the
docker network. Php-fpm server is NOT the one that connects to MariaDB Server.
In reality, when executing wordpress php scripts that require database access,
it is the scripts themselves that open a connection socket to MariaDB, wait for retrieval
and close the socket.

By being the scripts the ones that open the sockets, changing the scripts and the database
has no influence on php-fpm server, essentially allowing for decoupling of responsibilities.

Also, in this project, we have a single database, we could have many..... and it would be php-fpm's
responsibility to open conenctions wiith everybody. It could be configurable (probably is) as nginx.
But, let's keep it this way...? :)