package service;

import java.util.List;

import model.Prenotazione;
import model.Studente;

public interface PrenotazioneService {
	
//	List<Prenotazione> getPrenotazioni();
	List<Prenotazione> getPrenByAppId(int idAppello);
	void addPrenByApp(Studente s, int idAppello);
	boolean isPrenExists(Studente s, int idAppello);
	void deletePrenotazione(int idpren);
	void close();

}
