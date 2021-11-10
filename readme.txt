- Open the project directory in a terminal 

- Run 'npm install' - This will install all necessary node modules in dependency

- Install XAMPP for Backend and follow steps : 
	 - Copy the folder 'health'
	 - Go to C:\xampp\htdocs and paste folder 'health' there 
	 - Make a database 'health-monitoring' in MYSQL server from PHPMyAdmin
	 - Import the SQL file 'health-monitoring.sql' into the database (File can be found in the folder 'health')
	 - If your username/password for mysql is different than 'root':" ", 
		- Go to database.php in health/include folder 
		- Find the line new mysqli("localhost", "root", "", "health_monitoring");
		- Replace root and blank with your username and password for server

- Go to project directory in terminal again
- Run npm start, it will redirect you to the webapp