package repos;

import java.util.List;

import model.Prenotazione;
import model.Studente;

public interface PrenotazioneDAO {
	
	String FIND_ALL_JOIN = "SELECT * FROM prenotazione JOIN studente ON stud_prenotato = matricola JOIN appello ON app_prenotato = idAppello JOIN corso ON appello.materia = idcorso JOIN professore ON cattedra = idProfessore";
	String FIND_BY_ID = "SELECT * FROM prenotazione WHERE idpren = ?";
	String ADD = "INSERT INTO prenotazione (stud_prenotato, app_prenotato) VALUES (?, ?)";
	String UPDATE = "UPDATE prenotazione SET stud_prenotato = ?, app_prenotato = ? WHERE idpren = ?";
	String DELETE_BY_ID = "DELETE FROM prenotazione WHERE idpren = ?";
	String FIND_STUD_JOIN = "SELECT idpren, matricola, nome, cognome, data, appello.materia, corso.materia nome_materia FROM prenotazione JOIN studente ON stud_prenotato = matricola JOIN appello ON app_prenotato = idAppello JOIN corso ON appello.materia = idcorso WHERE matricola = ?";
	String FIND_BY_APP = "SELECT * FROM prenotazione JOIN studente ON matricola = stud_prenotato JOIN appello ON idAppello = app_prenotato JOIN corso ON idcorso = appello.materia JOIN professore ON cattedra = idProfessore WHERE app_prenotato = ?";
	
	String PREN_EXISTS = "SELECT * FROM prenotazione WHERE stud_prenotato = ? AND app_prenotato = ?";
	String FIND_BY_APP_STUD = "SELECT DISTINCT matricola, nome, cognome, idAppello, data, appello.materia, idcorso, corso.materia, cattedra, idpren FROM studente JOIN prenotazione ON matricola = stud_prenotato JOIN appello ON idAppello = app_prenotato JOIN corso ON idcorso = appello.materia WHERE idAppello = ? AND matricola = ?";
	
	List<Prenotazione> findAll();
	List<Prenotazione> findByAppId(int idAppello);
	Prenotazione findByAppStud(int idAppello, Studente s);
	Prenotazione findById(int idpren);
	void addPrenotazione(int matricola, int idAppello);
	void updatePrenotazione(int idpren, int stud_prenotato, int app_prenotato);
	void deletePrenotazione(int idpren);
	boolean isPrenExists(int matricola, int idAppello);
	void closeConnection();

}
