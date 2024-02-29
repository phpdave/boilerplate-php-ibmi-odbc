1. Clone the repo
2. Modify frontend/odbctest.php setting

```
$user = 'your_username';
$pass = 'your_password';
```
3. Modify odbc-driver-configs/odbc.ini and set the system to your IBM i's IP address or DNS name.  Set Database to the name of the database (can be found in IBM i Access Schemas under Databases)

```
System                  = 10.1.1.1
Database                = YOURDATABASE
```

4. Run docker-compose up --build
5. In your browser go to http://localhost:8080/odbctest.php

should see 

Connection successful!
IBMREQD
Y

6. In your browser go to http://localhost:8080/info.php

should see phpinfo information