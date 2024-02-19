package repos;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLSyntaxErrorException;
import java.util.ArrayList;
import java.util.List;

import model.Appello;
import model.Corso;
import model.Professore;

public class CorsoDAOImpl implements CorsoDAO {
	
	Connessione db = new Connessione();
	PreparedStatement ps;
	PreparedStatement ps1;
	ResultSet rs;
	ResultSet rs1;

	@Override
	public List<Corso> findAll() {
		List<Corso> corsi = new ArrayList<>();
		
		try {
			this.ps = db.getConnessione().prepareStatement(FIND_ALL);
			this.rs = this.ps.executeQuery();
			
			while (rs.next()) {
				int idCorso = this.rs.getInt(1);
				int idProfessore = this.rs.getInt(2);
				String nomeMateria = this.rs.getString(3);
				String nomeProf = this.rs.getString(4);
				String cognomeProf = this.rs.getString(5);
				
				Professore p1 = new Professore();
				p1.setIdProfessore(idProfessore);
				p1.setNome(nomeProf);
				p1.setCognome(cognomeProf);

				Corso c = new Corso();
				c.setIdCorso(idCorso);
				c.setMateria(nomeMateria);
				c.setProfessore(p1);
				
				corsi.add(c);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return corsi;
	}

	@Override
	public Corso findById(int idCorso) {
		return null;
	}

	@Override
	public void addCorso(String materia, int cattedra) {
		try {
			this.ps = this.db.getConnessione().prepareStatement(ADD);
			this.ps.setString(1, materia);
			this.ps.setInt(2, cattedra);
			this.ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			if (e instanceof SQLSyntaxErrorException) {
				System.err.println("Errore di sintassi SQL: verifica la query.");
			}
		}

	}

	@Override
	public void updateCorso(Corso c) {

	}

	@Override
	public void deleteCorsoById(int idCorso) {
		try {
			//voglio cancellare un corso che ha un appello collegato, che è a sua volta collegato ad una prenotazione
			int idAppello = 0;
			//trovo l'appello collegato al corso
			this.ps = this.db.getConnessione().prepareStatement(FIND_APP);
			this.ps.setInt(1, idCorso);
			this.rs = this.ps.executeQuery();
			while (this.rs.next()) {
				idAppello = this.rs.getInt(1);
				//cancello le prenotazioni collegate all'appello. Lo metto nel while poiché ci sono più appelli con id diverso collegati alla stessa materia
				this.ps = this.db.getConnessione().prepareStatement(DELETE_PREN);
				this.ps.setInt(1, idAppello);
				this.ps.executeUpdate();
			}
			
			
			//cancello gli appelli collegati al corso
			this.ps = this.db.getConnessione().prepareStatement(DELETE_APP);
			this.ps.setInt(1, idCorso);
			this.ps.executeUpdate();
			
			//cancello il corso
			this.ps = this.db.getConnessione().prepareStatement(DELETE_BY_ID);
			this.ps.setInt(1, idCorso);
			this.ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
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
	public boolean isCPresente(String materia) {
		boolean esiste = false;
		
		try {
			this.ps = db.getConnessione().prepareStatement(FIND_BY_MATERIA);
			this.ps.setString(1, materia);
			this.rs = this.ps.executeQuery();
			if (this.rs.next())
				esiste = true;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return esiste;
	}




//	@Override
//	public Professore findProfJoin(int matricola) {
//		Professore p = new Professore();
//		
//		try {
//			this.ps1 = this.db.getConnessione().prepareStatement(FIND_PROF_JOIN);
//			this.ps1.setInt(1, matricola);
//			this.rs1 = ps1.executeQuery();
//			this.rs1.next();
//			String nome = rs1.getString("nome");
//			String cognome = rs1.getString("cognome");
//			p.setNome(nome);
//			p.setCognome(cognome);
//			System.out.println("Professore trovato: " + p.getNome() + " " + p.getCognome());
//
//						
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		return p;
//	}

}
