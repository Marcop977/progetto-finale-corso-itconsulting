package repos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import model.Admin;

public class AdminDAOImpl implements AdminDAO {
	
	Connessione db = new Connessione();
	PreparedStatement ps;
	ResultSet rs;

	@Override
	public List<Admin> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void closeConnection() {
		// TODO Auto-generated method stub

	}

	@Override
	public Admin findByUser(String username, String password) {
		Admin a = null;
		
		try {
			this.ps = db.getConnessione().prepareStatement(FIND_BY_USER);
			this.ps.setString(1, username);
			this.ps.setString(2, password);
			this.rs = this.ps.executeQuery();
			this.rs.next();
			int idAdmin = this.rs.getInt(1);
			String usernameAdmin = this.rs.getString(2);
			String passwordAdmin = this.rs.getString(3);
			char tipoUtente = this.rs.getString(4).charAt(0);
			String nome = this.rs.getString(5);
			String cognome = this.rs.getString(6);
			
			a = new Admin();
			
			a.setIdAdmin(idAdmin);
			a.setUsername(usernameAdmin);
			a.setPassword(passwordAdmin);
			a.setNome(nome);
			a.setCognome(cognome);
			a.setTipoUtente(tipoUtente);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return a;
	}

}
