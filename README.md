1. Clone the repo
2. Modify .env setting and set username, password, and the system to your IBM i's IP address or DNS name.  Set Database to the name of the database (can be found in IBM i Access Schemas under Databases)
```
DB_USER='your_username';
DB_PASS='your_password';
DB_DATABASE=yourdb
DB_SYSTEM=your_dns_ip_of_system
DB_LIBRARY_LIST=,lib1,lib2,lib3
```
3. Run docker-compose up --build
4. In your browser go to https://localhost:8080/odbctest.php

should see 

Connection successful!
IBMREQD
Y

5. In your browser go to https://localhost:8080/info.php

should see phpinfo information