package database.util;

import java.sql.Connection;

public abstract class DatabaseConnection extends OracleConnectionInfo {
	
	private String connectMethod = "JDBC"; // JDBC or DATASOURCE
	
	public Connection CON = getCon(); // getJdbcConnection() or getDataSourceConnection()
	
	private Connection getCon() {
		if ("JDBC".equals(connectMethod)) {
			CON = getJdbcConnection();
		}
		if ("DATASOURCE".equals(connectMethod)) {
			CON = getDataSourceConnection();
		}		
		return null;
	}
}
