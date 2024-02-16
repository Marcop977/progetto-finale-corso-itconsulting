package repos;

import java.util.List;

import model.Studente;

public interface StudenteDAO {
	
	String FIND_ALL = "SELECT * FROM studente";
	String FIND_BY_ID = "SELECT * FROM studente WHERE matricola = ?";
	String FIND_BY_USERPASS = "SELECT * FROM studente WHERE username = ? AND password = ?"; //dopo aver aggiunto uno studente, al refresh della pagina quello studente viene aggiunto di nuovo. Effettuo quindi un controllo se lo studente esiste già
	String ADD = "INSERT INTO studente (username, password, tipo_utente, nome, cognome) VALUES (?, ?, ?, ?, ?)";
	String UPDATE = "UPDATE studente SET username = ?, password = ?, tipo_utente = ?, nome = ?, cognome = ? WHERE matricola = ?";
	String DELETE_BY_ID = "DELETE FROM studente WHERE matricola = ?";
	
	List<Studente> findAll();
	Studente findById(int matricola);
	boolean isPresente(String u, String p);
	void addStudente(Studente s);
	void updateStudente(Studente s);
	void deleteStudente(int matricola);
	void closeConnection();

}
