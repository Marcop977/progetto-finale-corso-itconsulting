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
	public void deleteProfessoreById(int idProfessore) {
		try {
			this.ps = conn.getConnessione().prepareStatement(DELETE_CORSO_COLLEGATO);
			this.ps.setInt(1, idProfessore);
			this.ps.executeUpdate();
			
			this.ps = conn.getConnessione().prepareStatement(DELETE_BY_ID);
			this.ps.setInt(1, idProfessore);
			this.ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void closeConnection() {
		// TODO Auto-generated method stub

	}


	@Override
	public int findProfByNameSur(String nome, String cognome) {
		int idProfessore = 0;
		
		try {
			this.ps = conn.getConnessione().prepareStatement(FIND_BY_NOME_COGNOME);
			this.ps.setString(1, nome);
			this.ps.setString(2, cognome);
			this.rs = this.ps.executeQuery();
			if (this.rs.next()) {
				idProfessore = this.rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return idProfessore;
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

	@Override
	public boolean isPresenteConNome(String n, String c) {
		boolean esiste = false;
		
		try {
			this.ps = conn.getConnessione().prepareStatement(FIND_BY_NOME_COGNOME);
			this.ps.setString(1, n);
			this.ps.setString(2, c);
			this.rs = this.ps.executeQuery();
			if (this.rs.next())
				esiste = true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return esiste;
	}

	@Override
	public Professore findByUserPass(String u, String p) {
		Professore prof = null;
		
		try {
			this.ps = this.conn.getConnessione().prepareStatement(FIND_BY_USERPASS);
			this.ps.setString(1, u);
			this.ps.setString(2, p);
			this.rs = this.ps.executeQuery();
			if (this.rs.next()) {
				int idProfessore = this.rs.getInt("idProfessore");
				String nome = this.rs.getString("nome");
				String cognome = this.rs.getString("cognome");
				String username = this.rs.getString("username");
				String password = this.rs.getString("password");
				prof = new Professore();
				prof.setIdProfessore(idProfessore);
				prof.setNome(nome);
				prof.setCognome(cognome);
				prof.setUsername(username);
				prof.setPassword(password);
				System.out.println("Professore trovato");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return prof;
	}

	@Override
	public boolean isProfessore(char tipo) {
		boolean esiste = false;
		try {
			this.ps = this.conn.getConnessione().prepareStatement(FIND_BY_TIPO);
			this.ps.setString(1, String.valueOf(tipo));
			this.rs = this.ps.executeQuery();
			
			if (this.rs.next())
				esiste = true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return esiste;
	}

	@Override
	public void updateProfessore(int idProfessore, String username, String password, String nome, String cognome) {
		try {
			this.ps = this.conn.getConnessione().prepareStatement(UPDATE);
			this.ps.setString(1, username);
			this.ps.setString(2, password);
			this.ps.setString(3, nome);
			this.ps.setString(4, cognome);
			this.ps.setInt(5, idProfessore);
			this.ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
