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
	String FIND_BY_ID = "SELECT corso.materia, corso.idcorso, nome, cognome, idProfessore, username, password, data, idAppello FROM appello JOIN corso ON idcorso = appello.materia JOIN professore ON cattedra = idProfessore WHERE idAppello = ?";
	String FIND_BY_PROF = "SELECT idcorso, corso.materia, idAppello, data FROM corso JOIN professore ON cattedra = idProfessore JOIN appello ON idAppello = idcorso WHERE idProfessore = ?";
	
	List<Appello> findAll();
	List<Appello> findAppById(int idAppello);
	Appello findById(int idAppello);
	void addAppello(Appello a);
	void updateAppello(Appello a);
	void deleteAppello(int idAppello);
	void closeConnection();
	List<Appello> findByProf(Professore p);
}
