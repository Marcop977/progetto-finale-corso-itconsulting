package repos;

import java.sql.Date;
import java.util.List;

import model.Appello;
import model.Corso;
import model.Professore;

public interface AppelloDAO {

	String FIND_ALL = "SELECT * FROM appello JOIN corso ON appello.materia = idcorso";
	String ADD = "INSERT INTO appello (data, materia) VALUES (?, ?)";
	String UPDATE = "UPDATE appello SET data = ?, materia = ? WHERE idAppello = ?";
	String DELETE_BY_ID = "DELETE FROM appello WHERE idAppello = ?";
	String DELETE_PRENOT = "DELETE FROM prenotazione WHERE app_prenotato = ?";
//	String DELETE_BY_CORSO = "DELETE FROM appello WHERE materia = ?";
	String FIND_APP = "SELECT * FROM appello WHERE materia = ? AND data = ?";
	String FIND_PRENOT = "SELECT FROM prenotazione WHERE app_prenotato = ?";
	String FIND_CORSO_APP = "select idcorso, corso.materia, nome, cognome, idAppello, data, appello.materia from corso join professore on cattedra = idProfessore join appello on appello.materia = idcorso";
	String FIND_BY_ID = "SELECT corso.materia, corso.idcorso, nome, cognome, idProfessore, username, password, data, idAppello FROM appello JOIN corso ON idcorso = appello.materia JOIN professore ON cattedra = idProfessore WHERE idcorso = ?";
	String FIND_BY_PROF = "SELECT idcorso, corso.materia, idAppello, data FROM corso JOIN professore ON cattedra = idProfessore JOIN appello ON appello.materia = idcorso WHERE idProfessore = ?";
	
	List<Appello> findAll();
	List<Appello> findAppByCorsoID(int idCorso);
	Appello findById(int idAppello);
	List<Appello> findCorsiApp();
	void addAppello(String data, int idCorso);
	void updateAppello(int idAppello, Date data, String materia);
	void deleteAppello(int idAppello);
//	void deleteAppelloByCorso(int corsoId);
	boolean isPrenPresente(int idAppello);
	boolean isAppPresente(int idCorso, Date data);
	void closeConnection();
	List<Appello> findByProf(Professore p);
}
