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

//	@Override
//	public List<Prenotazione> findAll() {
//		List<Prenotazione> prenotazioni = new ArrayList<>();
//		
//		try {
//			this.ps = this.db.getConnessione().prepareStatement(FIND_ALL);
//			this.rs = this.ps.executeQuery();
//			
//			while (rs.next()) {
//				int idPrenotazione = rs.getInt(1);
//				int studPrenotato = rs.getInt(2);
//				int appPrenotato = rs.getInt(3);
//				
//				
//				Studente s = new Studente();
//				this.ps1 = this.db.getConnessione().prepareStatement(FIND_STUD_JOIN); //prendimi lo studente con studPrenotato, collegato alla tabella prenotazione
//				this.ps1.setInt(1, studPrenotato);
//				this.rs1 = ps1.executeQuery();
//				if (rs1.next()) {
//					System.out.println("prenotazione:" + idPrenotazione);
//					String nome = rs1.getString("nome");
//					String cognome = rs1.getString("cognome");
//					s.setNome(nome);
//					s.setCognome(cognome);
//				} else {
//					System.out.println("Errore con studente");
//				}
//				
//				
//				Corso c = new Corso();
//				this.ps2 = this.db.getConnessione().prepareStatement(FIND_STUD_JOIN); // prendimi il corso di quello studente
//				this.ps2.setInt(1, studPrenotato);
//				this.rs2 = ps2.executeQuery();
//				if (rs2.next()) {
//					String nomeMateria = this.rs2.getString("nome_materia");
//					c.setMateria(nomeMateria);
//				} else {
//					System.out.println("Errore con corso");
//				}
//				
//				Appello a = new Appello();
//				this.ps3 = this.db.getConnessione().prepareStatement(FIND_STUD_JOIN); // prendimi l'appello di quello studente
//				this.ps3.setInt(1, studPrenotato);
//				this.rs3 = ps3.executeQuery();
//				if (rs3.next()) {
//					Date data = rs3.getDate("data");
//					int corsoId = rs3.getInt("materia");
//					a.setData(data);
//					a.setCorsoId(c);
//				} else {
//					System.out.println("Errore con appello");
//				}
//				
//				
//				Prenotazione p = new Prenotazione();
//				p.setIdPrenotazione(idPrenotazione);
//				p.setStudPrenotato(s);
//				p.setAppPrenotato(a);
//				
//				prenotazioni.add(p);
//			}
//			
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		
//		return prenotazioni;
//	}

	@Override
	public Prenotazione findById(int idpren) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addPrenotazione(Prenotazione p) {
		
		try {
			this.ps = this.db.getConnessione().prepareStatement(ADD);
			this.ps.setInt(1, p.getStudPrenotato().getMatricola());
			this.ps.setInt(2, p.getAppPrenotato().getIdAppello());
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



}
