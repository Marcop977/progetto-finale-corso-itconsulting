package repos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Corso;
import model.Prenotazione;
import model.Professore;
import model.Studente;

public class PrenotazioneDAOImpl implements PrenotazioneDAO{
	
	Connessione db;
	PreparedStatement ps;
	ResultSet rs;

	@Override
	public List<Corso> findAll() {
		List<Prenotazione> prenotazioni = new ArrayList<>();
		
		try {
			this.ps = this.db.getConnessione().prepareStatement(FIND_ALL);
			this.rs = this.ps.executeQuery();
			
			while (rs.next()) {
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

	@Override
	public Studente findById(int idCorso) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addCorso(Corso c, Professore p) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCorso(Corso c) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCorso(int idCorso) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void closeConnection() {
		// TODO Auto-generated method stub
		
	}

}
