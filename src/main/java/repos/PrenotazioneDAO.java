package repos;

import java.util.List;

import model.Appello;
import model.Prenotazione;
import model.Studente;

public interface PrenotazioneDAO {
	
	String FIND_ALL = "SELECT * FROM prenotazione";
	String FIND_BY_ID = "SELECT * FROM prenotazione WHERE idpren = ?";
	String ADD = "INSERT INTO prenotazione (stud_prenotato, app_prenotato) VALUES (?, ?)";
	String UPDATE = "UPDATE prenotazione SET stud_prenotato = ?, app_prenotato = ?";
	String DELETE_BY_ID = "DELETE FROM prenotazione WHERE idpren = ?";
	String FIND_STUD_JOIN = "SELECT idpren, matricola, nome, cognome, data, appello.materia, corso.materia nome_materia FROM prenotazione JOIN studente ON stud_prenotato = matricola JOIN appello ON app_prenotato = idAppello JOIN corso ON appello.materia = idcorso WHERE matricola = ?";
	String FIND_BY_APP = "SELECT DISTINCT matricola, nome, cognome, idAppello, data, appello.materia, idcorso, corso.materia, cattedra FROM studente JOIN prenotazione ON matricola = stud_prenotato JOIN appello ON idAppello = app_prenotato JOIN corso ON idcorso = appello.materia WHERE idAppello = ?";
	String PREN_EXISTS = "SELECT * FROM prenotazione WHERE stud_prenotato = ? AND app_prenotato = ?";
	
	
//	List<Prenotazione> findAll();
	List<Prenotazione> findByAppId(int idAppello);
	Prenotazione findById(int idpren);
	void addPrenByApp(Studente s, int idAppello);
	void updatePrenotazione(Prenotazione p);
	void deletePrenotazione(int idpren);
	boolean isPrenExists(Studente s, int idAppello);
	void closeConnection();

}
