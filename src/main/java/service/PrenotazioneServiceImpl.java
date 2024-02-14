package service;

import java.util.List;

import model.Prenotazione;
import repos.PrenotazioneDAO;
import repos.PrenotazioneDAOImpl;

public class PrenotazioneServiceImpl implements PrenotazioneService {
	
	PrenotazioneDAO dao = new PrenotazioneDAOImpl();

	@Override
	public List<Prenotazione> getPrenotazioni() {
		return this.dao.findAll();
	}

	@Override
	public void addPrenotazione(Prenotazione p) {
		this.dao.addPrenotazione(p);
	}

	@Override
	public void deletePrenotazione(int idpren) {
		this.dao.deletePrenotazione(idpren);
	}

	@Override
	public void close() {
		this.dao.closeConnection();
	}

}
