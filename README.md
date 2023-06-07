# House of Fire Online MarketPlace

For Professor Kyle Bastien AD350 Database course

Contributors:

- Derrek Do
- Mike Murphy
- Jared Scarr
- Petar Spasic

## Set-Up

### Database

- Run the provided sql script in your preferred mySQL GUI to get a database with dummy data loaded.

### IntelliJ
If you use a different code editor your steps may be different, but he concepts are the same.

1. Install the mysql connector called Connector/J for your operating system https://dev.mysql.com/downloads/connector/j/
2. Got to Project Structure which is under the menu icon in upper right corner
3. Go the Libraries and click the plus icon or add new
4. Find the location of the folder that contains the connector and click ok.
5. Under main menu navigate to Run -> Edit Configurations.
6. Add environmental variables in a list separated by semicolons
```DB_NAME=your-database-name;PASSWORD=yourpassword;USER_NAME=youruser```
7. Click apply and okay
8. Run Main class

