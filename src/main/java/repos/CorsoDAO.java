package repos;

import java.util.List;

import model.Corso;
import model.Professore;

public interface CorsoDAO {

	String FIND_BY_ID = "SELECT * FROM corso WHERE idcorso = ?";
	String ADD = "INSERT INTO corso (materia, cattedra) VALUES (?, ?)";
	String UPDATE = "UPDATE corso SET materia = ?, cattedra = ? WHERE idcorso = ?";
	String DELETE_BY_ID = "DELETE FROM corso WHERE idcorso = ?";
	String DELETE_APP = "DELETE FROM appello WHERE materia = ?";
	String DELETE_BY_CATTEDRA = "DELETE FROM corso WHERE cattedra = ?";
	String FIND_APP = "SELECT idAppello FROM appello WHERE materia = ?";
	String DELETE_PREN = "DELETE FROM prenotazione WHERE app_prenotato = ?";
	String FIND_PROF_JOIN = "SELECT idProfessore, username, password, nome, cognome FROM professore JOIN corso ON idProfessore = cattedra WHERE cattedra = ?";
	String FIND_ALL = "SELECT idcorso, idProfessore, materia, nome, cognome FROM corso JOIN professore ON cattedra = idProfessore";
	String FIND_BY_MATERIA = "SELECT * FROM corso WHERE materia = ?"; //se la materia esiste già, non me la aggiungere, poiché è possibile che lo stesso prof faccia più corsi, ma 1 corso non può essere sostenuto da più prof
//	String FIND_BY_PROF = "SELECT * FROM corso WHERE cattedra = ?";
	
	List<Corso> findAll();
	Corso findById(int idCorso);
//	List<Corso> findByProfId(int idProfessore);
	void addCorso(String materia, int cattedra);
	void updateCorso(int idCorso, String materia, int cattedra);
	void deleteCorsoById(int idCorso);
	void deleteCorsoByCattedra(int cattedra);
	boolean isCPresente(String materia);
	void closeConnection();
//	Professore findProfJoin(int matricola);
}
