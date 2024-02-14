package repos;

import java.util.List;

import model.Appello;

public interface AppelloDAO {

	String FIND_ALL = "SELECT * FROM appello";
	String FIND_BY_ID = "SELECT * FROM appello WHERE idAppello = ?";
	String ADD = "INSERT INTO appello (data, materia) VALUES (?, ?)";
	String UPDATE = "UPDATE appello SET data = ?, materia = ?";
	String DELETE_BY_ID = "DELETE FROM appello WHERE idAppello = ?";
	String FIND_CORSO_JOIN = "SELECT corso.materia, nome, cognome FROM appello JOIN corso ON idcorso = appello.materia JOIN professore ON cattedra = idProfessore WHERE idAppello = ?";
	
	List<Appello> findAll();
	Appello findById(int idAppello);
	void addAppello(Appello a);
	void updateAppello(Appello a);
	void deleteAppello(int idAppello);
	void closeConnection();
}
