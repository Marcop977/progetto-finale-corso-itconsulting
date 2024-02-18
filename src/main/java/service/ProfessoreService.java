package service;

import java.util.List;

import model.Professore;
import model.Studente;

public interface ProfessoreService {
	
	List<Professore> getProfessori();
	Professore getProfByUserPass(String username, String password);
	void addProfessore(Professore p);
	boolean isProfPresente(String username, String password);
	boolean isProfPresenteNome(String nome, String cognome);
	void deleteProfById(int idProfessore);
	int getIdByNameSur(String nome, String cognome);
	void close();

}
