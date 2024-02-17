package repos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Professore;

public class ProfessoreDAOImpl implements ProfessoreDAO {
	
	Connessione conn = new Connessione();
	PreparedStatement ps;
	ResultSet rs;

	@Override
	public List<Professore> findAll() {
		List<Professore> professori = new ArrayList<>();
		
		try {
			this.ps = conn.getConnessione().prepareStatement(FIND_ALL);
			this.rs = ps.executeQuery();
			
			while (rs.next()) {
				int idProfessore = rs.getInt(1);
				String username = rs.getString(2);
				String password = rs.getString(3);
				String nome = rs.getString(5);
				String cognome = rs.getString(6);
				
				Professore p = new Professore();
				p.setIdProfessore(idProfessore);
				p.setUsername(username);
				p.setPassword(password);
				p.setNome(nome);
				p.setCognome(cognome);
				
				professori.add(p);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return professori;
	}

	@Override
	public Professore findById(int idProfessore) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addProfessore(Professore p) {
		try {
			this.ps = conn.getConnessione().prepareStatement(ADD);
			this.ps.setString(1, p.getUsername());
			this.ps.setString(2, p.getPassword());
			this.ps.setString(3, String.valueOf(p.getTipoUtente()));;
			this.ps.setString(4, p.getNome());
			this.ps.setString(5, p.getCognome());
			this.ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void updateProfessore(Professore p) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteProfessore(int idProfessore) {
		// TODO Auto-generated method stub

	}

	@Override
	public void closeConnection() {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean isPresente(String u, String p) {
		boolean esiste = false;
		
		try {
			this.ps = conn.getConnessione().prepareStatement(FIND_BY_USERPASS);
			this.ps.setString(1, u);
			this.ps.setString(2, p);
			this.rs = this.ps.executeQuery();
			if (this.rs.next())
				esiste = true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return esiste;
	}

}
