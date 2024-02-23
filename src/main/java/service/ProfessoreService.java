package service;

import java.util.List;

import model.Professore;

public interface ProfessoreService {
	
	List<Professore> getProfessori();
	Professore getProfByUserPass(String username, String password);
	void addProfessore(Professore p);
	void updateProfessore(int id, String u, String p, String n, String c);
	boolean isProfPresente(String username, String password);
	boolean isProfPresenteNome(String nome, String cognome);
	boolean isProfessore(char tipo);
	void deleteProfById(int idProfessore);
	int getIdByNameSur(String nome, String cognome);
	void close();

}
