package repos;

import java.util.List;

import model.Prenotazione;

public interface PrenotazioneDAO {
	
	String FIND_ALL = "SELECT * FROM prenotazione";
	String FIND_BY_ID = "SELECT * FROM prenotazione WHERE idpren = ?";
	String ADD = "INSERT INTO prenotazione (stud_prenotato, app_prenotato) VALUES (?, ?)";
	String UPDATE = "UPDATE prenotazione SET stud_prenotato = ?, app_prenotato = ?";
	String DELETE_BY_ID = "DELETE FROM prenotazione WHERE idpren = ?";
	String FIND_STUD_JOIN = "SELECT idpren, matricola, nome, cognome, data, appello.materia, corso.materia nome_materia FROM prenotazione JOIN studente ON stud_prenotato = matricola JOIN appello ON app_prenotato = idAppello JOIN corso ON appello.materia = idcorso WHERE matricola = ?";
	
//	List<Prenotazione> findAll();
	Prenotazione findById(int idpren);
	void addPrenotazione(Prenotazione p);
	void updatePrenotazione(Prenotazione p);
	void deletePrenotazione(int idpren);
	void closeConnection();

}
