package repos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLSyntaxErrorException;
import java.util.ArrayList;
import java.util.List;

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
	public void updateCorso(int idCorso, String materia, int cattedra) {
		try {
			this.ps = this.db.getConnessione().prepareStatement(UPDATE);
			this.ps.setString(1, materia);
			this.ps.setInt(2, cattedra);
			this.ps.setInt(3, idCorso);
			this.ps.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		}
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

	@Override
	public void deleteCorsoByCattedra(int cattedra) {
		try {
			this.ps = this.db.getConnessione().prepareStatement(DELETE_BY_CATTEDRA);
			this.ps.setInt(1, cattedra);
			this.ps.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Corso> findByProfId(int idProfessore) {
		List<Corso> corsi = new ArrayList<>();
		try {
			this.ps = this.db.getConnessione().prepareStatement(FIND_BY_PROF);
			this.ps.setInt(1, idProfessore);
			this.rs = this.ps.executeQuery();
			while (this.rs.next()) {
				int idcorso = this.rs.getInt(1);
				String nomeMateria = this.rs.getString(2);
				
				Professore p = new Professore();
				p.setIdProfessore(idProfessore);
				
				Corso c = new Corso();
				c.setIdCorso(idcorso);
				c.setMateria(nomeMateria);
				c.setProfessore(p);
				
				corsi.add(c);
				
//				this.ps = this.db.getConnessione().prepareStatement(FIND_PROF_BY_CORSO);
//				this.ps.setInt(1, cattedra);
//				this.rs = this.ps.executeQuery();
//				if (this.rs.next()) {
//					String nome = this.rs.getString(5);
//					String cognome = this.rs.getString(6);
//					Professore p = new Professore();
//					p.setNome(nome);
//					p.setCognome(cognome);
//					
//					Corso c = new Corso();
//					c.setIdCorso(idcorso);
//					c.setMateria(nomeMateria);
//					c.setProfessore(p);
//					
//					corsi.add(c);
//				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return corsi;
	}
}
