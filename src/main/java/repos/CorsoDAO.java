package repos;

import java.util.List;

import model.Corso;
import model.Professore;

public interface CorsoDAO {

	String FIND_BY_ID = "SELECT * FROM corso WHERE idcorso = ?";
	String ADD = "INSERT INTO corso (materia, cattedra) VALUES (?, ?)";
	String UPDATE = "UPDATE corso SET materia = ?, cattedra = ?";
	String DELETE_BY_ID = "DELETE FROM corso WHERE idcorso = ?";
	String FIND_PROF_JOIN = "SELECT idProfessore, username, password, nome, cognome FROM professore JOIN corso ON idProfessore = cattedra WHERE cattedra = ?";
	String FIND_ALL = "SELECT idcorso, idProfessore, materia, nome, cognome FROM corso JOIN professore ON cattedra = idProfessore";
	String FIND_BY_MATERIA = "SELECT * FROM corso WHERE materia = ?"; //se la materia esiste già, non me la aggiungere, poiché è possibile che lo stesso prof faccia più corsi, ma 1 corso non può essere sostenuto da più prof
	
	
	List<Corso> findAll();
	Corso findById(int idCorso);
	void addCorso(String materia, int cattedra);
	void updateCorso(Corso c);
	void deleteCorsoById(int idCorso);
	boolean isCPresente(String materia);
	void closeConnection();
//	Professore findProfJoin(int matricola);
}
