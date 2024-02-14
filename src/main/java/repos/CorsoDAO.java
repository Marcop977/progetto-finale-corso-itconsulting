package repos;

import java.util.List;

import model.Corso;
import model.Professore;
import model.Studente;

public interface CorsoDAO {

	String FIND_ALL = "SELECT * FROM corso";
	String FIND_BY_ID = "SELECT * FROM corso WHERE idcorso = ?";
	String ADD = "INSERT INTO corso (materia, cattedra) VALUES (?, ?)";
	String UPDATE = "UPDATE corso SET materia = ?, cattedra = ?";
	String DELETE_BY_ID = "DELETE FROM corso WHERE cattedra = ?";
	String FIND_PROF_JOIN = "SELECT nome, cognome FROM professore JOIN corso ON idProfessore = cattedra WHERE cattedra = ?";
	
	List<Corso> findAll();
	Studente findById(int idCorso);
	void addCorso(Corso c, Professore p);
	void updateCorso(Corso c);
	void deleteCorso(int idCorso);
	void closeConnection();
	Professore findProfJoin(int matricola);
}
