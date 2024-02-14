package service;

import java.util.List;

import model.Prenotazione;

public interface PrenotazioneService {
	
	List<Prenotazione> getPrenotazioni();
	void addPrenotazione(Prenotazione p);
	void deletePrenotazione(int idpren);
	void close();

}
