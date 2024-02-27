1. Clone the repo
2. Modify frontend/odbctest.php setting

```
$user = 'your_username';
$pass = 'your_password';
```
3. Modify odbc-driver-configs/odbc.ini

```
System                  = 10.1.1.1
```

4. Run docker-compose up --build
5. In your browser go to http://localhost:8080/odbctest.php

should see 

Connection successful!
IBMREQD
Y

6. In your browser go to http://localhost:8080/info.php

should see phpinfo information