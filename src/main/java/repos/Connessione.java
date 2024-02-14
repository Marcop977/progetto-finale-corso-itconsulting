package repos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connessione {
	
	private final String HOST = "jdbc:mysql://localhost:3306/universita2";
	private final String USER = "root";
	private final String PASS = "Residentevil.97";
	
	private Connection conn;
	
	public Connection getConnessione() {
		if(this.conn == null)
			connetti();
		
		return this.conn;
	}
	
	private void connetti() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			this.conn = DriverManager.getConnection(HOST, USER, PASS);
			System.out.println("Connesso.");
		} catch (SQLException | ClassNotFoundException e) {
			System.err.println("Errore di connessione al DB " + e.getMessage());
		}  
	}

}