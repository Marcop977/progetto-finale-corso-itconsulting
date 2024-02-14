package repos;

import java.util.List;

import model.Studente;

public interface StudenteDAO {
	
	String FIND_ALL = "SELECT * FROM studente";
	String FIND_BY_ID = "SELECT * FROM studente WHERE matricola = ?";
	String ADD = "INSERT INTO studente (username, password, tipo_utente, nome, cognome) VALUES (?, ?, ?, ?, ?)";
	String UPDATE = "UPDATE studente SET username = ?, password = ?, tipo_utente = ?, nome = ?, cognome = ? WHERE matricola = ?";
	String DELETE_BY_ID = "DELETE FROM studente WHERE matricola = ?";
	
	List<Studente> findAll();
	Studente findById(int matricola);
	void addStudente(Studente s);
	void updateStudente(Studente s);
	void deleteStudente(int matricola);
	void closeConnection();

}
