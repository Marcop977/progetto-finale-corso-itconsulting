package repos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Studente;

public class StudenteDAOImpl implements StudenteDAO {
	
	Connessione db = new Connessione();
	PreparedStatement ps;
	ResultSet rs;	

	@Override
	public List<Studente> findAll() {
		List<Studente> studenti = new ArrayList<>();
		
		try {
			this.ps = this.db.getConnessione().prepareStatement(FIND_ALL);
			this.rs = this.ps.executeQuery();
			
			while (this.rs.next()) {
				int matricola = this.rs.getInt(1);
				String username = this.rs.getString(2);
				String password = this.rs.getString(3);
				char tipoUtente = this.rs.getString(4).charAt(0);
				String nome = this.rs.getString(5);
				String cognome = this.rs.getString(6);
				
				Studente s = new Studente();
				s.setMatricola(matricola);
				s.setUsername(username);
				s.setPassword(password);
				s.setTipoUtente(tipoUtente);
				s.setNome(nome);
				s.setCognome(cognome);
				
				studenti.add(s);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return studenti;
	}

	@Override
	public Studente findById(int matricola) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addStudente(Studente s) {
		try {
			this.ps = this.db.getConnessione().prepareStatement(ADD);
			this.ps.setString(1, s.getUsername());
			this.ps.setString(2, s.getPassword());
			this.ps.setString(3, String.valueOf(s.getTipoUtente()));
			this.ps.setString(4, s.getNome());
			this.ps.setString(5, s.getCognome());
			this.ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void updateStudente(Studente s) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteStudente(int matricola) {
		try {
			this.ps = this.db.getConnessione().prepareStatement(DELETE_BY_ID);
			this.ps.setInt(1, matricola);
			this.ps.executeUpdate();		
			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	
	public void closeConnection() {
		 try {
			 if (this.rs != null) {
		            this.rs.close();
		        }
		        if (this.ps != null) {
		            this.ps.close();
		        }
		        if (this.db != null && this.db.getConnessione() != null) {
		            this.db.getConnessione().close();
		        }
		 } catch (SQLException e) {
		        e.printStackTrace();
		 }		        
	}

	@Override
	public boolean isPresente(String u, String p) {
		boolean esiste = false;
		
		try {
			this.ps = db.getConnessione().prepareStatement(FIND_BY_USERPASS);
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
	public Studente findByUserPass(String u, String p) {
		Studente s = null;
		try {
			this.ps = this.db.getConnessione().prepareStatement(FIND_BY_USERPASS);
			this.ps.setString(1, u);
			this.ps.setString(2, p);
			this.rs = this.ps.executeQuery();
			if (this.rs.next()) {
				int matricola = this.rs.getInt("matricola");
				String nome = this.rs.getString("nome");
				String cognome = this.rs.getString("cognome");
				String username = this.rs.getString("username");
				String password = this.rs.getString("password");
				s = new Studente();
				s.setMatricola(matricola);
				s.setNome(nome);
				s.setCognome(cognome);
				s.setUsername(username);
				s.setPassword(password);
			} else {
				System.out.println("rs non trovato studente");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return s;
	}

}
