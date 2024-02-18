package repos;

import java.util.List;

import model.Professore;

public interface ProfessoreDAO {
	
	String FIND_ALL = "SELECT * FROM professore";
	String FIND_BY_ID = "SELECT * FROM professore WHERE idProfessore = ?";
	String ADD = "INSERT INTO professore (username, password, tipo_utente, nome, cognome) VALUES (?, ?, ?, ?, ?)";
	String FIND_BY_USERPASS = "SELECT * FROM professore WHERE username = ? AND password = ?";
	String UPDATE = "UPDATE professore SET username = ?, password = ?, tipo_utente = ?, nome = ?, cognome = ?";
	String DELETE_BY_ID = "DELETE FROM professore WHERE idProfessore = ?";
	String FIND_BY_NOME_COGNOME = "SELECT idProfessore, nome, cognome FROM professore WHERE nome = ? AND cognome = ?";
	String DELETE_CORSO_COLLEGATO = "DELETE FROM corso WHERE cattedra = ?";
	
	List<Professore> findAll();
	Professore findById(int idProfessore);
	Professore findByUserPass(String u, String p);
	void addProfessore(Professore p);
	boolean isPresente(String username, String password);
	boolean isPresenteConNome(String nome, String cognome);
	void updateProfessore(Professore p);
	void deleteProfessoreById(int idProfessore);
	int findProfByNameSur(String nome, String cognome);
	void closeConnection();


}
