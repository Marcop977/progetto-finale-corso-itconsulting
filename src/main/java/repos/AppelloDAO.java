package repos;

import java.util.List;

import model.Appello;
import model.Corso;
import model.Professore;

public interface AppelloDAO {

	String FIND_ALL = "SELECT * FROM appello";
	String ADD = "INSERT INTO appello (data, materia) VALUES (?, ?)";
	String UPDATE = "UPDATE appello SET data = ?, materia = ?";
	String DELETE_BY_ID = "DELETE FROM appello WHERE idAppello = ?";
	String FIND_CORSO_APP = "select idcorso, corso.materia, nome, cognome, idAppello, data, appello.materia from corso join professore on cattedra = idProfessore join appello on appello.materia = idcorso";
	String FIND_BY_ID = "SELECT corso.materia, corso.idcorso, nome, cognome, idProfessore, username, password, data, idAppello FROM appello JOIN corso ON idcorso = appello.materia JOIN professore ON cattedra = idProfessore WHERE idcorso = ?";
	String FIND_BY_PROF = "SELECT idcorso, corso.materia, idAppello, data FROM corso JOIN professore ON cattedra = idProfessore JOIN appello ON idAppello = idcorso WHERE idProfessore = ?";
	
	List<Appello> findAll();
	List<Appello> findAppByCorsoID(int idCorso);
	Appello findById(int idAppello);
	List<Appello> findCorsiApp();
	void addAppello(Appello a);
	void updateAppello(Appello a);
	void deleteAppello(int idAppello);
	void closeConnection();
	List<Appello> findByProf(Professore p);
}
