package repos;

import java.util.List;

import model.Admin;

public interface AdminDAO {
	
	String FIND_ALL = "SELECT * FROM amministratore";
	String FIND_BY_USER = "SELECT * FROM amministratore WHERE username = ? AND password = ?";
	
	List<Admin> findAll();
	Admin findByUser(String username, String password);
	void closeConnection();

}
