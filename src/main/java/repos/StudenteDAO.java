package repos;

import java.util.List;

import model.Studente;

public interface StudenteDAO {
	
	String FIND_ALL = "SELECT * FROM studente";
	String FIND_BY_ID = "SELECT * FROM studente WHERE matricola = ?";
	String FIND_BY_USERPASS = "SELECT * FROM studente WHERE username = ? AND password = ?"; //dopo aver aggiunto uno studente, al refresh della pagina quello studente viene aggiunto di nuovo. Effettuo quindi un controllo se lo studente esiste già, e quindi bloccare l'insert
	String FIND_BY_TIPO = "SELECT * FROM studente WHERE tipo_utente = ?";
	String ADD = "INSERT INTO studente (username, password, tipo_utente, nome, cognome) VALUES (?, ?, ?, ?, ?)";
	String UPDATE = "UPDATE studente SET username = ?, password = ?, nome = ?, cognome = ? WHERE matricola = ?";
	String DELETE_BY_ID = "DELETE FROM studente WHERE matricola = ?";
	String DELETE_PREN = "DELETE FROM prenotazione WHERE stud_prenotato = ?";
	
	List<Studente> findAll();
	Studente findById(int matricola);
	Studente findByUserPass(String u, String p);
	boolean isPresente(String u, String p);
	boolean isStudente(char tipo);
	void addStudente(Studente s);
	void updateStudente(int matricola, String nome, String cognome, String username, String password);
	void deleteStudente(int matricola);
	void closeConnection();

}
