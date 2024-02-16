package repos;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Appello;
import model.Corso;
import model.Prenotazione;
import model.Professore;
import model.Studente;

public class PrenotazioneDAOImpl implements PrenotazioneDAO{
	
	Connessione db = new Connessione();
	PreparedStatement ps;
	ResultSet rs;
	PreparedStatement ps1;
	ResultSet rs1;
	PreparedStatement ps2;
	ResultSet rs2;
	PreparedStatement ps3;
	ResultSet rs3;


	@Override
	public Prenotazione findById(int idpren) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addPrenByApp(Studente s, int idAppello) { //studente in sessione e appello inserito dall'utente
		
		try {
			this.ps = this.db.getConnessione().prepareStatement(ADD);
			this.ps.setInt(1, s.getMatricola());
			this.ps.setInt(2, idAppello);
			this.ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updatePrenotazione(Prenotazione p) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deletePrenotazione(int idpren) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public List<Prenotazione> findByAppId(int idAppello) {
		List<Prenotazione> prenotazioni = new ArrayList<>();
		
		try {
			this.ps = db.getConnessione().prepareStatement(FIND_BY_APP);
			this.ps.setInt(1, idAppello);
			this.rs = this.ps.executeQuery();
			
			while (rs.next()) {
				int matricola = rs.getInt(1);
				String nome = rs.getString(2);
				String cognome = rs.getString(3);
				int idAppello2 = rs.getInt(4);
				Date data = rs.getDate(5);
				int corsoId = rs.getInt(6);
				int idCorso = rs.getInt(7);
				String nomeMateria = rs.getString(8);
				int cattedra = rs.getInt(9);
				
				Studente s = new Studente();
				s.setMatricola(matricola);
				s.setNome(nome);
				s.setCognome(cognome);
				
				Corso c = new Corso();
				c.setIdCorso(idCorso);
				c.setMateria(nomeMateria);
				
				Appello a = new Appello();
				a.setIdAppello(idAppello2);
				a.setData(data);
				a.setCorsoId(c);
				
				Prenotazione p = new Prenotazione();
				p.setStudPrenotato(s);
				p.setAppPrenotato(a);
				
				prenotazioni.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return prenotazioni;
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
	public boolean isPrenExists(Studente s, int idAppello) {
		
		boolean prenotazioneEsistente = false;
		
		try {
			this.ps = db.getConnessione().prepareStatement(PREN_EXISTS);
			this.ps.setInt(1, s.getMatricola());
			this.ps.setInt(2, idAppello);
			
			this.rs = this.ps.executeQuery();
			if (rs.next()) {
				prenotazioneEsistente = true;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return prenotazioneEsistente;
	}

	@Override
	public Prenotazione findByAppStud(int idAppello, Studente s1) {
	    Prenotazione p = null;
	    
	    try {
	        this.ps1 = db.getConnessione().prepareStatement(FIND_BY_APP_STUD);
	        this.ps1.setInt(1, idAppello);
	        this.ps1.setInt(2, s1.getMatricola());
	        this.rs1 = this.ps1.executeQuery();
	        
	        if (this.rs1.next()) {
	            int matricola = rs1.getInt(1);
	            String nome = rs1.getString(2);
	            String cognome = rs1.getString(3);
	            int idAppello2 = rs1.getInt(4);
	            Date data = rs1.getDate(5);
	            int corsoId = rs1.getInt(6);
	            int idCorso = rs1.getInt(7);
	            String nomeMateria = rs1.getString(8);
	            int cattedra = rs1.getInt(9);
	            int idPren = rs1.getInt(10);
	            
	            Studente s = new Studente();
	            s.setMatricola(matricola);
	            s.setNome(nome);
	            s.setCognome(cognome);
	            
	            Corso c = new Corso();
	            c.setIdCorso(idCorso);
	            c.setMateria(nomeMateria);
	            
	            Appello a = new Appello();
	            a.setIdAppello(idAppello2);
	            a.setCorsoId(c);
	            a.setData(data);
	            
	            p = new Prenotazione();
	            p.setStudPrenotato(s);
	            p.setIdPrenotazione(idPren);
	            p.setAppPrenotato(a);
	        } else {
	        	System.out.println("rs non trovato");
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs1 != null) {
	                rs1.close();
	            }
	            if (ps1 != null) {
	                ps1.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    return p;
	}






}
