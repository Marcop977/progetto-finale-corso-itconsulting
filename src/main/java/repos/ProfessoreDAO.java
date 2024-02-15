package repos;

import java.util.List;

import model.Professore;

public interface ProfessoreDAO {
	
	String FIND_ALL = "SELECT * FROM professore";
	String FIND_BY_ID = "SELECT * FROM professore WHERE idProfessore = ?";
	String ADD = "INSERT INTO professore (username, password, tipo_utente, nome, cognome) VALUES (?, ?, ?, ?, ?)";
	String UPDATE = "UPDATE professore SET username = ?, password = ?, tipo_utente = ?, nome = ?, cognome = ?";
	String DELETE_BY_ID = "DELETE FROM professore WHERE idProfessore = ?";
	
	List<Professore> findAll();
	Professore findById(int idProfessore);
	void addProfessore(Professore p);
	void updateProfessore(Professore p);
	void deleteProfessore(int idProfessore);
	void closeConnection();


}
