<?php
// Connection information
$dsn = 'odbc:DockerProductionDSN';
$user = 'your_username';
$pass = 'your_password';

try {
    // Connect to IBM i
    $conn = new PDO($dsn, $user, $pass);
    echo "Connection successful! <br>";

    // SQL query
    $query = "SELECT * FROM SYSIBM.SYSDUMMY1";

    // Prepare and execute the query
    $stmt = $conn->prepare($query);
    $stmt->execute();

    // Start the table
    echo "<table border='1'>";

    // Fetch and display the header row
    $columns = array_keys($stmt->fetch(PDO::FETCH_ASSOC));
    echo "<tr>";
    foreach ($columns as $column) {
        echo "<th>" . htmlspecialchars($column) . "</th>";
    }
    echo "</tr>";

    // Reset the cursor to the beginning
    $stmt->execute();

    // Fetch and display each row of data
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo "<tr>";
        foreach ($row as $data) {
            echo "<td>" . htmlspecialchars($data) . "</td>";
        }
        echo "</tr>";
    }
    echo "</table>";

    // No need to free the result, PDO does it automatically

} catch (PDOException $e) {
    // Connection failed, get the error message
    echo "Connection failed: " . $e->getMessage();
}
?>
