package service;

import java.util.List;

import model.Prenotazione;
import model.Studente;

public interface PrenotazioneService {
	
	List<Prenotazione> getPrenotazioni();
	List<Prenotazione> getPrenByAppId(int idAppello);
	Prenotazione getPrenByAppStud(int idAppello, Studente s);
	void addPrenotazione(int matricola, int idAppello);
	boolean isPrenExists(int matricola, int idAppello);
	void deletePrenotazione(int idpren);
	void close();

}
