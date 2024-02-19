package service;

import java.util.List;

import model.Prenotazione;
import model.Studente;
import repos.PrenotazioneDAO;
import repos.PrenotazioneDAOImpl;

public class PrenotazioneServiceImpl implements PrenotazioneService {
	
	PrenotazioneDAO dao = new PrenotazioneDAOImpl();

	@Override
	public List<Prenotazione> getPrenotazioni() {
		return this.dao.findAll();
	}

	@Override
	public void addPrenotazione(int matricola, int idAppello) {
		this.dao.addPrenotazione(matricola, idAppello);
	}

	@Override
	public void deletePrenotazione(int idpren) {
		this.dao.deletePrenotazione(idpren);
	}

	@Override
	public void close() {
		this.dao.closeConnection();
	}

	@Override
	public List<Prenotazione> getPrenByAppId(int idAppello) {
		return this.dao.findByAppId(idAppello);
	}

	@Override
	public boolean isPrenExists(int matricola, int idAppello) {
		return this.dao.isPrenExists(matricola, idAppello);
	}

	@Override
	public Prenotazione getPrenByAppStud(int idAppello, Studente s) {
		return this.dao.findByAppStud(idAppello, s);
	}

}
